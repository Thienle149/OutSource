//
//  ShiftModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/31/21.
//

import Foundation
class ShiftModel {
    var protecter: ProtecterModel!
    var status: StatusTimeKeeping!
    var time: String!
    
    init(protecter: ProtecterModel, status: StatusTimeKeeping, time: String) {
        self.protecter = protecter
        self.status = status
        self.time = time
    }
}
