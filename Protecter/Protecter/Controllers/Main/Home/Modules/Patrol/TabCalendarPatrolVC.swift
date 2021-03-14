//
//  CalendarPatrolVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit
import XLPagerTabStrip

class TabCalendarPatrolVC: BaseVC, IndicatorInfoProvider {
    
    @IBOutlet weak var tbvPatrol: UITableView!
    var sections: [SectionPatrolModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    private func config() {
        tbvPatrol.register(UINib(nibName: SectionPatrolCell.identifier, bundle: nil), forCellReuseIdentifier: SectionPatrolCell.identifier)
        tbvPatrol.register(UINib(nibName: ItemPatrolCell.identifier, bundle: nil), forCellReuseIdentifier: ItemPatrolCell.identifier)
        
        let patrol1 = PatrolModel(rangeTime: "07: 00 - 09:00", state: .notActive)
        let patrol2 = PatrolModel(rangeTime: "09: 00 - 11:00", state: .notActive)
        let patrol3 = PatrolModel(rangeTime: "11: 00 - 13:00", state: .notActive)
        let section1 = SectionPatrolModel(name: "Tuyến tuần tra lầu 1", note: "Tuần tra trong tòa nhà", patrols: [patrol1, patrol2, patrol3])
        
        let section2 = SectionPatrolModel(name: "Tuyến tuần tra lầu 2", note: "Tuần tra bên ngoài tòa nhà", patrols: [patrol1, patrol2, patrol3])
        
        sections = [section1, section2]
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Lịch tuần tra")
    }

}
 
extension TabCalendarPatrolVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].open ? sections[section].patrols.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        let dataIndex = row - 1
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionPatrolCell.identifier) as! SectionPatrolCell
            cell.setUp(section: sections[section], indexPath: indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemPatrolCell.identifier) as! ItemPatrolCell
            cell.setUp(patrol: sections[indexPath.section].patrols[dataIndex])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        return row == 0 ? 80 : 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterPatrolView()
        
        footerView.action = { _ in
            print("show detail patrol")
        }
        footerView.layoutIfNeeded()
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].open ? 30 : 0
    }
    
}

extension TabCalendarPatrolVC: SectionPatrolCellDelegate {
    func showItemCell(indexPath: IndexPath) {
        let index = indexPath.section
        sections[index].open = !sections[index].open
        tbvPatrol.reloadSections([indexPath.section], with: .automatic)
    }
}
