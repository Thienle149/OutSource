//
//  FloatingStateVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit

class FloatingStateVC: BaseVC {

    @IBOutlet weak var tbvState: UITableView!
    
    
    var states: [String]!
    public var selectedIndex = 0;
    public var delegate: FloatingStateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    // MARK: Private
    private func config() {
        self.tbvState.register(UINib(nibName: AreaProtectCell.identifier, bundle: nil), forCellReuseIdentifier: AreaProtectCell.identifier)
    }
    
}

extension FloatingStateVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AreaProtectCell.identifier) as! AreaProtectCell
        let state = states[indexPath.row]
        cell.setUpOfState(title: state)
        cell.imvSelect.image = indexPath.row == selectedIndex ? #imageLiteral(resourceName: "icons8-unchecked-radio-button-96 (1)") : #imageLiteral(resourceName: "icons8-unchecked-radio-button-96")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectArea(current: indexPath)
        self.delegate?.didSelectState(index: indexPath.row)
        self.dismissNoneAnimate()
    }
    
    private func didSelectArea(current: IndexPath) {
        for i in 0..<states.count {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = self.tbvState.cellForRow(at: indexPath) as! AreaProtectCell
            cell.imvSelect.image = current == indexPath ? #imageLiteral(resourceName: "icons8-unchecked-radio-button-96 (1)") : #imageLiteral(resourceName: "icons8-unchecked-radio-button-96")
        }
    }
}

protocol FloatingStateDelegate {
    func didSelectState(index: Int)
}
