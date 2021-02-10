//
//  BaseLoginVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/23/21.
//

import UIKit

class BaseLoginVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.back()
    }
    
    func back() {
        self.pop()
    }
}
