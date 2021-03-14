//
//  PatrolVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit
import XLPagerTabStrip

class PatrolVC: BaseButtonBarPagerTabStripVC {

    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.backgroundColor = Contants.Color.main
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let tabCalendarPatrolVC = TabCalendarPatrolVC()
        let tabHistoryPatrolVC = TabHistoryPatrolVC()
        
        return [tabCalendarPatrolVC, tabHistoryPatrolVC]
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func actionCreateState(_ sender: Any) {
        let createStateVC = CreateStateVC()
        self.navigationController?.pushViewController(createStateVC, animated: true)
    }
}

extension PatrolVC: StateViewDelegate {
    func didSelectState() {
        let detailStateVC = DetailStateVC()
        self.navigationController?.pushViewController(detailStateVC, animated: true)
    }
}
