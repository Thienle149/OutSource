//
//  StateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit
import XLPagerTabStrip

class StateVC: BaseButtonBarPagerTabStripVC {

    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.backgroundColor = Contants.Color.main
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let tab24HourStateVC = Tab24HourStateVC()
        let tabHistoryStateVC = TabHistoryStateVC()
        
        return [tab24HourStateVC, tabHistoryStateVC]
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func actionCreateState(_ sender: Any) {
        let createStateVC = CreateStateVC()
        self.navigationController?.pushViewController(createStateVC, animated: true)
    }
}
extension StateVC: StateViewDelegate {
    func didSelectState() {
        let detailStateVC = DetailStateVC()
        self.navigationController?.pushViewController(detailStateVC, animated: true)
    }
}
