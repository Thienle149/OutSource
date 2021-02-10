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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
