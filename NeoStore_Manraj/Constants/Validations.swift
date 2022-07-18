//
//  Validations.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 11/07/22.
//

import Foundation
import UIKit

extension String{
    // name(first and last) validation
    func isNameValid() -> Bool{
        if (self.count>=3){
            return true
        }
        return false
           }
    //email validation
    func isEmailValid() -> Bool{
        let inputRegex = "^[A-Za-z0-9._%+-]+@[a-zA-z0-9.-]+\\.[A-Za-z]{2,4}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegex)
        return inputpred.evaluate(with: self)
    }
    // password validation
    func isPasswordValid() -> Bool{
        let inputRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegex)
        return inputpred.evaluate(with: self)
    }
    //phone number password
    func isPnoValid() -> Bool{
//        let inputRegex = "^[0-9]{10}$"
//        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegex)
//        return inputpred.evaluate(with: self)
        if self.count == 10, let _ = Int(self) {
            return true
        }
        return false
    }
    
}


