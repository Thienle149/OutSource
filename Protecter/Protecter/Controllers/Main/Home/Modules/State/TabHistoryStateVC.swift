//
//  TabHistoryStateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit
import XLPagerTabStrip

class TabHistoryStateVC: BaseVC, IndicatorInfoProvider {
    
    @IBOutlet weak var stateView: StateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Lịch sử")
    }
    
    private func config() {
        self.stateView.isHistory = true
        self.stateView.delegate = self
    }

}

extension TabHistoryStateVC: StateViewDelegate {
    func didSelectState() {
        let detailStateVC = DetailStateVC()
        self.push(detailStateVC)
    }
    
    func didSelectArea(_ vc: UIViewController) {
        self.push(vc)
    }
}
