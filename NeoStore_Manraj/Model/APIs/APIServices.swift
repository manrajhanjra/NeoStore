//
//  APIServices.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 08/07/22.
//

import Foundation

typealias AnyDict = [String: Any]

    enum API {
        case forRegister(parameter: AnyDict)
        case forLogin(parameter: AnyDict)
        case forProductList(parameter: AnyDict)
}
enum ApiResponse<T> {
    case success(value: T)
    case failure(error: Error)
}


extension API {
    
    var path: String{
        let baseURL="http://staging.php-dev.in:8844/trainingapp/api/"
            switch self{
            case .forRegister: return baseURL + "users/register"
            case .forLogin: return baseURL + "users/login"
            case .forProductList: return baseURL + "products/getList"
            }
        }
       
    var parameters: AnyDict? {
        switch self{
        case .forLogin(let param),
                .forRegister(let param), .forProductList(let param) : return param
        
        default : return nil 
        }
    }
    
    var method: String? {
        switch self {
        case .forRegister, .forLogin:
            return "POST"
        default: return "GET"
        }
    }
}

