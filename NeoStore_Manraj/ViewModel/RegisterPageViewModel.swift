//
//  LoginPageViewModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 11/07/22.
//

import Foundation

protocol RegisterPageViewModelType {
    func registerUser(textFields: RegisterTextFields, completion: @escaping(ApiResponse<CustomerMainModel>) -> Void)
    func isValid(textFields: RegisterTextFields) -> String?
}

class RegisterPageViewModel: RegisterPageViewModelType {
    
    func isValid(textFields: RegisterTextFields) -> String?{
        var isItValid: String?
        if(!textFields.fnameText.isNameValid()){
            isItValid = "Enter Valid"
        } else
        if(textFields.fnameText == ""){
            isItValid = "Please fill in a first name"
        } else
        if(!textFields.lnameText.isNameValid()){
            isItValid = "Enter Valid Last Name"
        } else
        if(textFields.lnameText == ""){
            isItValid = "Please fill in a last name"
        } else
        if(!textFields.emailText.isEmailValid()){
            isItValid = "Please enter a Valid Email"
        } else
        if(textFields.emailText == ""){
            isItValid = "Please fill in an Email"
        } else
        if(!textFields.passwordText.isPasswordValid()){
            isItValid = "Please enter a Valid Password"
        } else
        if(textFields.passwordText == ""){
            isItValid =  "Please fill in a password"
        } else
        if(textFields.conpasswordText != textFields.passwordText){
            isItValid =  "Confirmed Password does not match"
        } else
        if(textFields.gender == ""){
            isItValid =  "Please choose a gender"
        } else
        if(!textFields.phoneText.isPnoValid()){
            isItValid =  "Please enter a valid Phone Number"
        } else
        if(textFields.phoneText == ""){
            isItValid =  "Please fill in a Phone Number"
        }else
        if(textFields.count%2 != 0){
            isItValid =  "Please accept the Terms and Conditions"
        }
      return isItValid
    }
    
    func registerUser(textFields: RegisterTextFields, completion: @escaping(ApiResponse<CustomerMainModel>) -> Void){
        UserService.sharedInstance.toRegister(fname: textFields.fnameText, lname: textFields.lnameText, email: textFields.emailText, password: textFields.passwordText, confpassword: textFields.conpasswordText, gender: textFields.gender, phoneNo: textFields.phoneText) { response in
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
    
    
    

