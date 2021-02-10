//
//  TabHistoryProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit
import XLPagerTabStrip

class TabHistoryProblemVC: BaseVC, IndicatorInfoProvider {
    
    @IBOutlet weak var tbvProblem: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Lịch sử")
    }
    
    private func config() {
        self.tbvProblem.register(UINib(nibName: ProblemCell.identifier, bundle: nil), forCellReuseIdentifier: ProblemCell.identifier)
    }

}

extension TabHistoryProblemVC: UITableViewDataSource, UITableViewDelegate, ProblemCellDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemCell.identifier) as! ProblemCell
        cell.setUp(needDetail: true)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func showDetail() {
        let detailProblemVC = DetailHistoryProblemVC()
        detailProblemVC.isScreenHandled = false
        self.push(detailProblemVC)
    }
}
