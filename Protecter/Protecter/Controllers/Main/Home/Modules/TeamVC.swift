//
//  TeamVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit
import iOSDropDown

class TeamVC: BaseVC {

    @IBOutlet weak var shiftDropdown: DropDown!
    @IBOutlet weak var tbvShift: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    private func config() {
        self.tbvShift.register(UINib(nibName: TeamCell.identifier, bundle: nil), forCellReuseIdentifier: TeamCell.identifier)
        
        self.shiftDropdown.optionArray = ["Lotte","Big C", "IMT", "CMS"]
        self.shiftDropdown.text = "Lotte"
        self.shiftDropdown.selectedIndex = 0
    }

    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
}

extension TeamVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.identifier) as! TeamCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(175)
    }
}
