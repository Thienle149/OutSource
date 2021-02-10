//
//  SelectAreaProtectVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit
import iOSDropDown

protocol SelectedAreaProtectDelegate {
    func didSelectArea(index: Int)
}

class SelectAreaProtectVC: BaseVC {

    @IBOutlet weak var tbvArea: UITableView!
    
    //Properties
    public var areas: [String]!
    public var selectedIndex = 0
    public var delegate: SelectedAreaProtectDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    // MARK: Private
    private func config() {
        self.tbvArea.register(UINib(nibName: AreaProtectCell.identifier, bundle: nil), forCellReuseIdentifier: AreaProtectCell.identifier)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
}

extension SelectAreaProtectVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AreaProtectCell.identifier) as! AreaProtectCell
        let index = indexPath.row
        cell.setUp(title: areas[index])
        cell.imvSelect.image = index == selectedIndex ? #imageLiteral(resourceName: "icons8-unchecked-radio-button-96 (1)") : #imageLiteral(resourceName: "icons8-unchecked-radio-button-96")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectArea(current: indexPath)
        self.selectedIndex = indexPath.row
        self.delegate?.didSelectArea(index: indexPath.row)
        self.pop()
    }
    
    private func didSelectArea(current: IndexPath) {
        for i in 0..<areas.count {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = self.tbvArea.cellForRow(at: indexPath) as! AreaProtectCell
            cell.imvSelect.image = current == indexPath ? #imageLiteral(resourceName: "icons8-unchecked-radio-button-96 (1)") : #imageLiteral(resourceName: "icons8-unchecked-radio-button-96")
        }
    }
    
}
