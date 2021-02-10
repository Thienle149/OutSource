//
//  ReportProblemCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit

class ReportProblemCell: UICollectionViewCell {

    @IBOutlet weak var imvProblem: UIImageView!
    @IBOutlet weak var lblProblem: UILabel!
    @IBOutlet weak var vBackground: UIView!
    
    static let identifier = "ReportProblemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexString: "E5E5E5").cgColor
        self.layer.cornerRadius = 5
    }
    
    public func setUp(categoryProblem: CategoryProblemModel) {
        self.imvProblem.image = categoryProblem.image
        self.lblProblem.text = categoryProblem.title
    }

}
