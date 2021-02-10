//
//  MediaCell.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/9/21.
//

import UIKit

protocol MediaCellDelegate {
    func removeMedia(indexPath: IndexPath)
}

class MediaCell: UICollectionViewCell {
    
    @IBOutlet weak var imvMedia: UIImageView!
    
    private var indexPath: IndexPath!
    
    public var delegate: MediaCellDelegate?
    
    static let identifier = "MediaCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func actionRemoveMedia(_ sender: Any) {
        self.delegate?.removeMedia(indexPath: indexPath)
    }
    
    public func setUp(media: MediaModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        if let imageMedia = media as? MediaImageModel {
            self.imvMedia.image = imageMedia.image
        } else {
            self.imvMedia.image = #imageLiteral(resourceName: "icons8-play-button-circled-90")
        }
    }
}
