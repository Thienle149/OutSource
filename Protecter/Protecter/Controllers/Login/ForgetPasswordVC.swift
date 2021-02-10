//
//  ForgetPasswrodViewController.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/11/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit

class ForgetPasswordVC: BaseLoginVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionContinue(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
