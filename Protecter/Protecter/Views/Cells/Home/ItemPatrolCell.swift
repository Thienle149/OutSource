//
//  ItemPatrolCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit

class ItemPatrolCell: UITableViewCell {

    @IBOutlet weak var lblRangeTime: UILabel!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    
    static let identifier: String = "ItemPatrolCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setUp(patrol: PatrolModel) {
        lblRangeTime.text = patrol.rangeTime
        lblNote.text = patrol.note
        let imageState =  patrol.state.getImage()
        btnAction.setImage(imageState, for: .normal)
    }
    
    @IBAction func actionActive(_ sender: Any) {
    }
}
