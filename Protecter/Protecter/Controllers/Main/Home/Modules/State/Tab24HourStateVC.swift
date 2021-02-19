//
//  Tab24HourStateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit
import XLPagerTabStrip

class Tab24HourStateVC: BaseVC, IndicatorInfoProvider {

    @IBOutlet weak var stateView: StateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    private func config() {
        self.stateView.delegate = self
        self.stateView.vc = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Hiện trạng 24h")
    }

}

extension Tab24HourStateVC: StateViewDelegate {
    func didSelectState() {
        let detailStateVC = DetailStateVC()
        self.push(detailStateVC)
    }
    
    func didSelectArea(_ vc: UIViewController) {
        self.push(vc)
    }
}
