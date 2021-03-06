//
//  TabListProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit
import XLPagerTabStrip

class TabListProblemVC: BaseVC, IndicatorInfoProvider {
  
    @IBOutlet weak var tbvProblem: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Danh sách")
    }
    
    private func config() {
        self.tbvProblem.register(UINib(nibName: ProblemCell.identifier, bundle: nil), forCellReuseIdentifier: ProblemCell.identifier)
    }
}

extension TabListProblemVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemCell.identifier) as! ProblemCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailListProblemVC = DetailListProblemVC()
        self.push(detailListProblemVC)
    }
}
