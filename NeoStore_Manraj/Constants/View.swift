//
//  View.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 05/07/22.
//

import Foundation
import UIKit



extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UIViewController{
     func alert(message:String, handler: ((UIAlertAction) -> Void)? = nil){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: handler)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
}
