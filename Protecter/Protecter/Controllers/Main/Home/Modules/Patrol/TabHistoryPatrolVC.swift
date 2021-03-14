//
//  HistoryPatrolVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//
import UIKit
import XLPagerTabStrip

class TabHistoryPatrolVC: BaseVC, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    private func config() {
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Lịch sử")
    }

}
