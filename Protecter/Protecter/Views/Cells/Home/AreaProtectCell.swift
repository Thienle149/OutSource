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
    @IBOutlet weak var widthConstraintImage: NSLayoutConstraint!
    
    static let identifier = "AreaProtectCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUp(title: String) {
        self.lblTitle.text = title
    }
    
    public func setUpOfState(title: String) {
        self.widthConstraintImage.constant = 0
        self.lblTitle.text = title
    }
}
