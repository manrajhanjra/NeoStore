//
//  TextFieldModel.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 12/07/22.
//

import Foundation

struct RegisterTextFields{
    let fnameText, lnameText, emailText, passwordText, conpasswordText, phoneText,gender: String
    let count: Int
}

struct LoginTextFields{
    let emailText, passwordText: String
}

struct ProductData{
    let productId: Int
    let limit, page: Int?
}
