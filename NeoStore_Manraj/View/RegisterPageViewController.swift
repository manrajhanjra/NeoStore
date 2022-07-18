//
//  RegisterPageViewController.swift
//  NeoStore_Manraj
//
//  Created by Neosoft on 06/07/22.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var neoLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var maleLbl: UILabel!
    @IBOutlet weak var femaleLbl: UILabel!
    @IBOutlet weak var agreeLbl: UILabel!
    @IBOutlet weak var agreeBtn: UIButton!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confPasTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var count = 1
    var gender: String="M"
    lazy var viewModel: RegisterPageViewModelType = RegisterPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        
        
        mainView.backgroundColor = .bckColor
        mainView.backgroundColor = .clear
        self.view.backgroundColor = UIColor.bckColor

        loadNavigation()
        setTextField()
        setLabel()
        setButton()
        addingLeftImage()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hidekeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        

    }
    
    func loadNavigation(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setLabel(){
        registerLbl.backgroundColor = .bckColor
        registerLbl.textColor = .neoColor
        neoLbl.textColor = .neoColor
        genderLbl.textColor = .neoColor
        maleLbl.textColor = .neoColor
        femaleLbl.textColor = .neoColor
        agreeLbl.textColor = .neoColor
    }
    func setTextField(){
        fnameTextField.textColor = .neoColor
        fnameTextField.backgroundColor = .bckColor
        fnameTextField.layer.borderColor = UIColor.neoColor.cgColor
        fnameTextField.layer.borderWidth = 2
        fnameTextField.placeHolderColor = .neoColor
        lnameTextField.textColor = .neoColor
        lnameTextField.backgroundColor = .bckColor
        lnameTextField.layer.borderColor = UIColor.neoColor.cgColor
        lnameTextField.layer.borderWidth = 2
        lnameTextField.placeHolderColor = .neoColor
        emailTextField.textColor = .neoColor
        emailTextField.backgroundColor = .bckColor
        emailTextField.layer.borderColor = UIColor.neoColor.cgColor
        emailTextField.layer.borderWidth = 2
        emailTextField.placeHolderColor = .neoColor
        passwordTextField.textColor = .neoColor
        passwordTextField.backgroundColor = .bckColor
        passwordTextField.layer.borderColor = UIColor.neoColor.cgColor
        passwordTextField.layer.borderWidth = 2
        passwordTextField.placeHolderColor = .neoColor
        passwordTextField.isSecureTextEntry = true
        confPasTextField.isSecureTextEntry = true
        confPasTextField.textColor = .neoColor
        confPasTextField.backgroundColor = .bckColor
        confPasTextField.layer.borderColor = UIColor.neoColor.cgColor
        confPasTextField.layer.borderWidth = 2
        confPasTextField.placeHolderColor = .neoColor
        phoneTextField.textColor = .neoColor
        phoneTextField.backgroundColor = .bckColor
        phoneTextField.layer.borderColor = UIColor.neoColor.cgColor
        phoneTextField.layer.borderWidth = 2
        phoneTextField.placeHolderColor = .neoColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    func addingLeftImage(){
        addLeftImageTo(txtFIeld: fnameTextField, Image: UIImage(named: "username_icon")!)
        addLeftImageTo(txtFIeld: lnameTextField, Image: UIImage(named: "username_icon")!)
        addLeftImageTo(txtFIeld: emailTextField, Image: UIImage(named: "email_icon")!)
        addLeftImageTo(txtFIeld: passwordTextField, Image: UIImage(named: "password_icon")!)
        addLeftImageTo(txtFIeld: confPasTextField, Image: UIImage(named: "cpassword_icon")!)
        addLeftImageTo(txtFIeld: phoneTextField, Image: UIImage(named: "cellphone")!)
    }
    
    func setButton(){
        backBtn.tintColor = .neoColor
        backBtn.backgroundColor = .bckColor
        agreeBtn.setImage(UIImage(named: "uncheck_icon"), for: .normal)
        registerBtn.backgroundColor = .neoColor
        registerBtn.tintColor = .bckColor
        maleBtn.setImage(UIImage(named: "chkn"), for: .normal)
        femaleBtn.setImage(UIImage(named: "chkn"), for: .normal)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let loginVC = sb.instantiateViewController(identifier: "LoginPageViewController")
            self.navigationController?.pushViewController(loginVC, animated: true)
       
    }
    
    
    @IBAction func maleBtnTapped(_ sender: Any) {
        maleBtn.setImage(UIImage(named: "chky"), for: .normal)
    femaleBtn.setImage(UIImage(named: "chkn"), for: .normal)
        gender = "M"
    }
    
    
    @IBAction func femaleBtnTapped(_ sender: Any) {
        femaleBtn.setImage(UIImage(named: "chky"), for: .normal)
    maleBtn.setImage(UIImage(named: "chkn"), for: .normal)
        gender = "F"
    }
    
    @IBAction func agreeBtnTapped(_ sender: Any) {
        count+=1
        if count%2 == 0{
            agreeBtn.setImage(UIImage(named: "checked_icon"), for: .normal)
        }
        else{
            agreeBtn.setImage(UIImage(named: "uncheck_icon"), for: .normal)
        }
    }

    @IBAction func registerBtnTapped(_ sender: Any) {
        let fnametext = fnameTextField.text ??  ""
        let lnametext = lnameTextField.text ?? ""
        let emailtext = emailTextField.text ?? ""
        let passwordtext = passwordTextField.text ?? ""
        let conpasswordtext = confPasTextField.text ?? ""
        let phonetext = phoneTextField.text ?? ""
        
        let model = RegisterTextFields(fnameText: fnametext, lnameText: lnametext, emailText: emailtext, passwordText: passwordtext, conpasswordText: conpasswordtext, phoneText: phonetext, gender: gender, count: count)
        if let textFieldError = viewModel.isValid(textFields: model) {
           alert(message: textFieldError)
        }
        else{
            viewModel.registerUser(textFields: model) { response in
                switch response {
                    case .success(_):
                    self.alert(message: "Registration Succesfull") { action in
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    case .failure(let error):
                    self.alert(message: "Error: \(error)")
                }
            }
        }
    }
    
    @objc func hidekeyboard(){
        self.view.endEditing(true)
    }

    @objc func keyboardWillShow(notifiation: NSNotification){
        if let keyboardFrame: NSValue = notifiation.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue{
            
            
            let keyboardHeight = keyboardFrame.cgRectValue.height
//            let keyboardAppear = view.convert(keyboardHeight,from: view.window)
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
               scrollView.contentInset = insets
               scrollView.scrollIndicatorInsets = insets
        }
    }

    @objc func keyboardWillHide(){
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
}

