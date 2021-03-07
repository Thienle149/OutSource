//
//  TeamCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var imvUser: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnCall: UIButton!
    
    static let identifier = "TeamCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setUp(shift: ShiftModel) {
        let (backgroundColor, textColor) = shift.status.getButtonColor()
        self.lblUser.text = shift.protecter.name
        self.btnStatus.titleLabel?.text = shift.status.rawValue
        self.btnStatus.backgroundColor = backgroundColor
        self.btnStatus.titleLabel?.textColor = textColor
        self.lblTime.text = shift.time
    }
    
    private func config() {
        self.btnCall.layer.borderWidth = 1
        self.btnCall.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    @IBAction func actionCall(_ sender: Any) {
        if let phoneURL = URL(string: "tel://0123") {
            let application = UIApplication.shared
            if application.canOpenURL(phoneURL) {
                application.open(phoneURL, options: [:], completionHandler: nil)
            } else {
                
            }
        }
    }
    
}
