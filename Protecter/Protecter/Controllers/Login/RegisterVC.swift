//
//  RegisterViewController.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/9/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit

class RegisterVC: BaseLoginVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        let otpRegisterVC = Utils.storyboary(screen: .otpRegisterVC, asClass: OTPRegisterVC.self)
        self.push(otpRegisterVC)
    }
}
