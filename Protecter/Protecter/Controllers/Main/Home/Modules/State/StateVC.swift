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
        self.headerView.backgroundColor = Constants.Color.main
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let tab24HourStateVC = Tab24HourStateVC()
        let tabHistoryStateVC = TabHistoryStateVC()
        
        return [tab24HourStateVC, tabHistoryStateVC]
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
