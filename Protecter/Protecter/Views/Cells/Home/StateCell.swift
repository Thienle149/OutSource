//
//  StateCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import UIKit

class StateCell: UITableViewCell {

    static let identifier = "StateCell"
    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var heightConstraintUser: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintFloor: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintLabelFloor: NSLayoutConstraint!
    
    @IBOutlet weak var userView: UIView!
    
    @IBOutlet weak var floorView: UIView!
    
    @IBOutlet weak var lblFloorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setUp() {
        self.setHistory(isHistory: false)
    }
    
    public func setUpOfHistory() {
        self.setHistory(isHistory: true)
    }
    
    private func setHistory(isHistory: Bool) {
        self.userView.isHidden = !isHistory
        self.lblFloorView.isHidden = !isHistory
        self.floorView.isHidden = isHistory
    }
}
