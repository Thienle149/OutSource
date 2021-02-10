//
//  MenuVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/23/21.
//

import UIKit

protocol MenuDelegate {
    func logout()
}

class MenuVC: BaseVC {
    
    var delegate: MenuDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
    
    @IBAction func logOut(_ sender: Any) {
        UIView.transition(with: self.view.window!, duration: 0.5, options: .transitionCrossDissolve) {
            
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
}
