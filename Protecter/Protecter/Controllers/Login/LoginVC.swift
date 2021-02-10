//
//  LoginViewController.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/8/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit

class LoginVC: BaseVC{
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
        self.configUI()
        self.configData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.isHiddenNavigationBar = true
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
        if self.tfPhoneNumber.text == "0389382432" {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        Utils.readFileJson(fileName: "userLogin") { (dict) in
            let response = ResponseModel(dict: dict)
            if response.isOk {
                let user = UserModel(dict: response.data!)
                Constants.global.user = user
                let mainVC = MainTabBarVC()
                self.push(mainVC)
            } else {
                self.showToast(response.messageText!)
            }
            self.hideLoading()
        }}} else if tfPhoneNumber.text == "0969144852" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            Utils.readFileJson(fileName: "leadProtecter") { (dict) in
                let response = ResponseModel(dict: dict)
                if response.isOk {
                    let user = UserModel(dict: response.data!)
                    Constants.global.user = user
                    let mainVC = MainTabBarVC()
                    self.push(mainVC)
                } else {
                    self.showToast(response.messageText!)
                }
                self.hideLoading()
            }}
        } else {
            self.hideLoading()
            self.showToast("Tài khoản không chính xác")
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
//
//    override func push(_ vc: UIViewController, isBarHidden: Bool = false) {
//                let appearance = UINavigationBarAppearance()
//                appearance.shadowColor = UIColor.white
//                appearance.backgroundColor = Constants.Color.main
//                appearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:UIColor.white]
//                self.navigationController?.navigationBar.standardAppearance = appearance
//                super.push(vc)
//    }
    
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == tfPhoneNumber) {
            linePhoneNumberView.backgroundColor = Constants.Color.lineActive
            linePasswordView.backgroundColor = Constants.Color.lineInActive
            heightConstraintLinePhone.constant = 2
            heightConstraintLinePassword.constant = 1
        } else if(textField == tfPassword) {
            linePhoneNumberView.backgroundColor = Constants.Color.lineInActive
            linePasswordView.backgroundColor = Constants.Color.lineActive
            heightConstraintLinePhone.constant = 1
            heightConstraintLinePassword.constant = 2
        }
    }
}
