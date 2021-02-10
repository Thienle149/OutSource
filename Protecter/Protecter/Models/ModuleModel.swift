//
//  ModuleModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/24/21.
//

import Foundation
import UIKit

class ModuleModel {
    var title: String!
    var image: UIImage!
    var vc: UIViewController!
    
    init(title: String, image: UIImage, vc: UIViewController) {
        self.title = title
        self.image = image
        self.vc = vc
    }
}
