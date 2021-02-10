//
//  AlertCancelProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/9/21.
//

import UIKit

class AlertCancelProblemVC: BaseVC {

    @IBOutlet weak var imvClose: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismissNoneAnimate()
    }
    
    //MARK: Private
    private func config() {
        self.imvClose.image = #imageLiteral(resourceName: "icons8-multiply-96")
    }
}
