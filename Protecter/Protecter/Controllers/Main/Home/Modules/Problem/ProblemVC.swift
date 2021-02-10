//
//  ProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit
import XLPagerTabStrip

class ProblemVC: BaseButtonBarPagerTabStripVC {
    
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.backgroundColor = Constants.Color.main
    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let tabListVC = TabListProblemVC()
        let tabHistoryVC = TabHistoryProblemVC()
        
        return [tabListVC, tabHistoryVC]
    }
    
}
