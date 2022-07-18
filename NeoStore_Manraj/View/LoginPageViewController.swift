//
//  LoginPageViewController.swift
//  NeoStore
//
//  Created by Neosoft on 04/07/22.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var neoLbl: UILabel!
    @IBOutlet weak var usernametextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var fpasBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var regLbl: UILabel!
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    lazy var viewModel: LoginPageViewModelType = LoginPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .bckColor
        
        navigationBar()
        
        usernametextfield.text = "manrajhanjra@gmail.com"
        passwordtextfield.text = "cbbr2$A9"
        
        setLabel()
        
        setTextField()
        addLeftImageTo(txtFIeld: usernametextfield, Image: UIImage(named: "username_icon")!)
        addLeftImageTo(txtFIeld: passwordtextfield, Image: UIImage(named: "password_icon")!)
        
        setButton()
    }
    
    func navigationBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setLabel(){
        neoLbl.textColor = .neoColor
        regLbl.textColor = .neoColor
    }
    
    func setTextField(){
        usernametextfield.textColor = .neoColor
        usernametextfield.backgroundColor = .bckColor
        usernametextfield.layer.borderColor = UIColor.neoColor.cgColor
        usernametextfield.layer.borderWidth = 2
        usernametextfield.placeHolderColor = .neoColor
        passwordtextfield.textColor = .neoColor
        passwordtextfield.placeHolderColor = .neoColor
        passwordtextfield.backgroundColor = .bckColor
        passwordtextfield.layer.borderColor = UIColor.neoColor.cgColor
        passwordtextfield.layer.borderWidth = 2
        passwordtextfield.isSecureTextEntry = true
    }
    
    func setButton(){
        loginBtn.backgroundColor = .neoColor
        loginBtn.tintColor = .bckColor
        fpasBtn.tintColor = .neoColor
        addBtn.setImage(UIImage(named: "Plus"), for: .normal)

    }
    
    func addLeftImageTo(txtFIeld: UITextField, Image img : UIImage){
        
        let internalView=UIView(frame: CGRect(x: 0.0, y: 0.0, width: 40, height: 30))
        
        let leftImageView=UIImageView(frame: CGRect(x: 5.0, y: 5.0, width: 30, height: 20))
        
        internalView.addSubview(leftImageView)
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = img
        txtFIeld.leftView = internalView
        txtFIeld.leftViewMode = .always
    }
    
    @IBAction func clickedPlusBtn(_ sender: Any) {
        let registerVC = sb.instantiateViewController(identifier: "RegisterPageViewController")
            self.navigationController?.pushViewController(registerVC, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func clickedLoginBtn(_ sender: Any) {
        let emailText = usernametextfield.text ?? ""
        let passwordText = passwordtextfield.text ?? ""
        
        let model = LoginTextFields(emailText: emailText, passwordText: passwordText)
        
        if let textFieldError = viewModel.isValid(textfields: model){
            self.alert(message: textFieldError)
        }
        else{
            viewModel.loginUser(textfields: model) { response in
                switch response{
                case .success(_):
                    DispatchQueue.main.async {
                        let homevc = self.sb.instantiateViewController(withIdentifier: "HomePage")
                        self.navigationController?.pushViewController(homevc, animated: true)
                    }
                case .failure(let error):
                    self.alert(message: "Error \(error)")
                }
            }
        }
    }
    
}







