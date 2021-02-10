//
//  ProblemCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import UIKit

protocol ProblemCellDelegate {
    func showDetail()
}

class ProblemCell: UITableViewCell {

    static let identifier = "ProblemCell"
    
    @IBOutlet weak var btnDetail: UIButton!
    
    public var delegate: ProblemCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config()
    }
    
    // Mark: Private
    private func config() {
        self.btnDetail.isHidden = true
    }
    
    public func setUp(needDetail: Bool = false) {
        self.btnDetail.isHidden = needDetail == true ? false : true
    }
    
    @IBAction func actionDetail(_ sender: Any) {
        self.delegate?.showDetail()
    }
}
