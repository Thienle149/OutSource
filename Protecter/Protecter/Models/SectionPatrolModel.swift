//
//  SectionPatrolModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit

class SectionPatrolModel: NSObject {
    var name: String!
    var note: String!
    var patrols: [PatrolModel]!
    
    // UI
    var open: Bool
    
    init(name: String, note: String, patrols: [PatrolModel], open: Bool = false) {
        self.name = name
        self.note = note
        self.patrols = patrols
        self.open = open
    }
}
