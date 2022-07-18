//
//  APIManager.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 08/07/22.
//

import Foundation

class APIManager {
    
    static let sharedInstance = APIManager()
    
    
    func apiManager(serviceType: API, completionHandler:@escaping (ApiResponse<Any>) ->Void){
        
        
        let session = URLSession.shared
        if let urlRequest = URL(string: serviceType.path) {
            var request = URLRequest(url: urlRequest)
            request.httpMethod = serviceType.method
            

            
            if let params = serviceType.parameters{
                if serviceType.method == "POST"{
                    var requestBodyComponents = URLComponents()
                    requestBodyComponents.queryItems = params.map{
                        (key, value) in
                        URLQueryItem(name: key, value: String(describing: value))
                    }
                    request.httpBody = requestBodyComponents.query?.data(using: .utf8)
                }
                else{
                    var urlComponents = URLComponents(string: serviceType.path)
                    urlComponents?.queryItems = params.map{
                        (key, value) in
                        URLQueryItem(name: key, value: String(describing: value))
                    }
                    request.url = urlComponents?.url
                }
            }
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    completionHandler(.failure(error: error!))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(error: error!))
                    return
                }
                
                do {
                    //create json object from data
                    if (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil {
                        completionHandler(.success(value: data))
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completionHandler(.failure(error: error))
                }
            })
            task.resume()
        }
    }
}
