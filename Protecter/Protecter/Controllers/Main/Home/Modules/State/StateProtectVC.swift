//
//  StateProtectVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit

class StateProtectVC: BaseVC {

    @IBOutlet weak var tbvState: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    //MARK: Action
    @IBAction func actionCreateState(_ sender: Any) {
    }
    
    //MARK: Private
    private func config() {
        self.tbvState.register(UINib(nibName: StateCell.identifier, bundle: nil), forCellReuseIdentifier: StateCell.identifier)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
}

extension StateProtectVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StateCell.identifier) as! StateCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    
}
