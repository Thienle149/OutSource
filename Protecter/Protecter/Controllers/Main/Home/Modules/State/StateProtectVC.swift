//
//  StateProtectVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit

class StateProtectVC: BaseVC {
    
    @IBOutlet weak var stateView: StateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    private func config() {
        self.stateView.delegate = self
        self.stateView.vc = self
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
}

extension StateProtectVC: StateViewDelegate {
    func didSelectState() {
        let detailStateVC = DetailStateVC()
        self.push(detailStateVC)
    }
}
