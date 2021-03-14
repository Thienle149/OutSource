//
//  PatrolModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit

class PatrolModel: NSObject {
    var rangeTime: String!
    var note: String!
    var state: PatrolState!
    
    init(rangeTime: String,note: String = "", state: PatrolState) {
        self.rangeTime = rangeTime
        self.note = note
        self.state = state
    }
}
