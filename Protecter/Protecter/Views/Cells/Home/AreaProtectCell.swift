//
//  AreaProtectCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit

class AreaProtectCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imvSelect: UIImageView!
    
    static let identifier = "AreaProtectCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUp(title: String) {
        self.lblTitle.text = title
//        self.imvSelect.image = isSelected ? #imageLiteral(resourceName: "icons8-unchecked-radio-button-96 (1)") : #imageLiteral(resourceName: "icons8-unchecked-radio-button-96")
    }
}
