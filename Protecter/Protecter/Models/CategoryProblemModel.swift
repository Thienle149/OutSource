//
//  CategoryProblemModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import Foundation
import UIKit

class CategoryProblemModel {
    var image: UIImage!
    var title: String!
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}
