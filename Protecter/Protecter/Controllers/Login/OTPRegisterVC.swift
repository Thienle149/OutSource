//
//  OTPRegisterViewController.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/11/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit

class OTPRegisterVC: BaseLoginVC {

    @IBOutlet weak var otpView: OTPFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "XÁC NHÂN"
        setupOtpView()
    }
     
    
    func setupOtpView(){
        self.otpView.fieldsCount = 6
        self.otpView.fieldBorderWidth = 0.5
        self.otpView.defaultBorderColor = UIColor.gray
        self.otpView.filledBorderColor = Constants.Color.lineActive
        self.otpView.cursorColor = UIColor.red
        self.otpView.displayType = .square
        self.otpView.fieldSize = CGSize(width: 50, height: 70)
        self.otpView.fieldRadius = 10
        self.otpView.separatorSpace = 8
        self.otpView.shouldAllowIntermediateEditing = false
        self.otpView.initializeUI()
        self.otpView.isFirstFocus = false
    }

}
