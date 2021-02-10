//
//  MoudleCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/24/21.
//

import UIKit

class ModuleCell: UICollectionViewCell {

    static let identifier = "ModuleCell"
    
    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var imvModule: UIImageView!
    @IBOutlet weak var lblModule: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setShadowCell()
        // Initialization code
    }
    
    public func setUp(_ module: ModuleModel) {
        self.lblModule.text = module.title
        self.imvModule.image = module.image
    }
    
    
    
    private func setShadowCell() {
          self.vBackground.layer.cornerRadius = 5.0
          
          //To apply border
          self.vBackground.layer.borderWidth = 0.5
          self.vBackground.layer.borderColor = UIColor.white.cgColor

          //To apply Shadow
          self.vBackground.layer.shadowOpacity = 0.2
          self.vBackground.layer.shadowRadius = 3.0
          self.vBackground.layer.shadowOffset = CGSize(width: 0, height: 3) // Use any CGSize
          self.vBackground.layer.shadowColor = UIColor.black.cgColor
      }

}
