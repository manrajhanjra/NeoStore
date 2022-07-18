//
//  LoginPageViewModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 12/07/22.
//

import Foundation

protocol LoginPageViewModelType{
    func isValid(textfields: LoginTextFields) -> String?
    func loginUser(textfields: LoginTextFields, completion: @escaping(ApiResponse<CustomerMainModel>) -> Void)
}

class LoginPageViewModel: LoginPageViewModelType{
    
    func isValid(textfields: LoginTextFields) -> String?{
        var isItValid: String?
        if(!textfields.emailText.isEmailValid()){
            isItValid = "Please enter a valid email"
        }else
        if(!textfields.passwordText.isPasswordValid()){
            isItValid = "Please enter a valid password"
        }
       return isItValid
    }
    
    func loginUser(textfields: LoginTextFields, completion: @escaping(ApiResponse<CustomerMainModel>) -> Void){
        UserService.sharedInstance.toLogin(email: textfields.emailText, password: textfields.passwordText){response in
            switch response{
        case .success(let value):
                completion(.success(value: value))
            case .failure(let error):
            print(error.localizedDescription)
            completion(.failure(error: error))
        }
    }
    }
}
