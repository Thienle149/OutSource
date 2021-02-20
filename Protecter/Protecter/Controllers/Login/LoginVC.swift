//
//  LoginViewController.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/8/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: APIController<LoginVM>{
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var linePhoneNumberView: UIView!
    @IBOutlet weak var linePasswordView: UIView!
    @IBOutlet weak var heightConstraintLinePassword: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintLinePhone: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm = LoginVM(controller: self)
        self.configUI()
        self.configData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let user = Contants.global.user {
            tfPhoneNumber.text = user.phone
            tfPassword.text = user.password
            self.actionLogin(self.btnLogin!)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    //Mark: Private
    private func configUI() {    }
    
    
    private func configData() {
        
    }
    
    //Mark: Action
    @IBAction func actionLogin(_ sender: Any) {
        self.showLoading()
        let (allow, errs) = vm.validate(phone: self.tfPhoneNumber.text ?? "", password: self.tfPassword.text ?? "")
        if allow {
            vm.login(phone: self.tfPhoneNumber.text ?? "", password: self.tfPassword.text ?? "") { (success, err) in
                if success {
                    let mainVC = MainTabBarVC()
                    self.push(mainVC)
                } else {
                    self.showToast(err?.rawValue ?? "")
                }
                self.hideLoading()
            }
        } else  {
            self.showToast(errs.description)
            self.hideLoading()
        }
    }
    
    
    @IBAction func actionRegister(_ sender: Any) {
        let registerVC = Utils.storyboary(screen: .register, asClass: RegisterVC.self)
        self.push(registerVC)
    }
    
    
    @IBAction func actionForgetPassword(_ sender: Any) {
        let forgetPasswordVC = Utils.storyboary(screen: .forgetPassword, asClass: ForgetPasswordVC.self)
        self.push(forgetPasswordVC)
        
    }
    
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == tfPhoneNumber) {
            linePhoneNumberView.backgroundColor = Contants.Color.lineActive
            linePasswordView.backgroundColor = Contants.Color.lineInActive
            heightConstraintLinePhone.constant = 1
            heightConstraintLinePassword.constant = 1
        } else if(textField == tfPassword) {
            linePhoneNumberView.backgroundColor = Contants.Color.lineInActive
            linePasswordView.backgroundColor = Contants.Color.lineActive
            heightConstraintLinePhone.constant = 1
            heightConstraintLinePassword.constant = 1
        }
    }
}
