//
//  File.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 08/07/22.
//

import Foundation


class UserService {
    
    static let sharedInstance = UserService()
    
    func toRegister(fname: String, lname: String, email: String, password: String, confpassword: String, gender: String, phoneNo: String, completion: @escaping(ApiResponse<CustomerMainModel>) -> Void) {
        
        let param = ["first_name": fname, "last_name": lname, "email": email, "password": password, "confirm_password": confpassword, "gender": gender, "phone_no": Int(phoneNo) ?? 0] as [String : Any]
        
        APIManager.sharedInstance.apiManager(serviceType: .forRegister(parameter: param)) { (response) in
            switch response{
            case .success(value: let data):
                if let jsonData = data as? Data , let value = JSONParser.processResponse(result: jsonData, type: CustomerMainModel?.self) {
                    if let ValueData = value {
                        completion(.success(value: ValueData))
                    }
                    else {
                        
                    }
                }
            case .failure(error: let error):
                print(error.localizedDescription)
                completion(.failure(error: error))
            }
        }
    }
    
    func toLogin(email: String, password: String, completion:@escaping(ApiResponse<CustomerMainModel>) -> Void){
        
        let param = ["email": email, "password": password] as [String: Any]
        
        
        APIManager.sharedInstance.apiManager(serviceType: .forRegister(parameter: param)) { (response) in
            switch response{
            case .success(value: let data):
                if let jsonData = data as? Data , let value = JSONParser.processResponse(result: jsonData, type: CustomerMainModel?.self) {
                    if let ValueData = value {
                        completion(.success(value: ValueData))
                    }
                    else {
                        
                    }
                }
            case .failure(error: let error):
                print(error.localizedDescription)
                completion(.failure(error: error))
            }
        }
    }
    
    func getProductList(productId: Int, limit: Int?, page: Int?, completion: @escaping(ApiResponse<ProductMainModel>) -> Void){
        
        let param = ["product_category_id": productId, "limit": limit ?? 10, "page": page ?? 1] as [String: Any]
        
        APIManager.sharedInstance.apiManager(serviceType: .forProductList(parameter: param)){(response) in
            switch response{
            case .success(value: let data):
                if let jsonData = data as? Data, let value = JSONParser.processResponse(result: jsonData, type: ProductMainModel?.self){
                    if let ValueData = value{
                        completion(.success(value: ValueData))
                    }
                    }
            case .failure(error: let error):
                print(error.localizedDescription)
                completion(.failure(error: error))
            }
        }
}
    
}
    
