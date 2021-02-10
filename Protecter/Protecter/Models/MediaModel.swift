//
//  MediaModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/9/21.
//

import Foundation
import UIKit

class MediaModel {
    var type: MediaType!
    
    init(type: MediaType) {
        self.type = type
    }
}

class MediaImageModel: MediaModel {
    var image: UIImage!
    
    init(image: UIImage) {
        super.init(type: .image)
        self.image = image
    }
}

class MediaAudioModel: MediaModel {
    var audioName: String!
    
    init(audioName: String) {
        super.init(type: .audio)
        self.audioName = audioName
    }
}
