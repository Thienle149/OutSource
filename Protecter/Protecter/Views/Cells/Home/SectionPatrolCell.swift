//
//  SectionPatrolCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit

protocol SectionPatrolCellDelegate {
    func showItemCell(indexPath: IndexPath)
}

class SectionPatrolCell: UITableViewCell {

    @IBOutlet weak var lblSectionName: UILabel!
    @IBOutlet weak var lblSectionNote: UILabel!
    @IBOutlet weak var btnShow: UIButton!
    
    static let identifier: String = "SectionPatrolCell"
    private var indexPath: IndexPath!
    public var delegate: SectionPatrolCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setUp(section: SectionPatrolModel, indexPath: IndexPath!) {
        lblSectionName.text = section.name
        lblSectionNote.text = section.note
        
        let imageState = section.open ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        btnShow.setBackgroundImage(imageState, for: .normal)
        self.indexPath = indexPath
    }
    
    @IBAction func actionShow(_ sender: Any) {
        delegate?.showItemCell(indexPath: indexPath)
    }
}
