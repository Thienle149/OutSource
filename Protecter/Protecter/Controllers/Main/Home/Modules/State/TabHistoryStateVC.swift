//
//  TabHistoryStateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit
import XLPagerTabStrip

class TabHistoryStateVC: BaseVC, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Lịch sử")
    }

}
