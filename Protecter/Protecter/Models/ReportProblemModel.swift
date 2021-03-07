//
//  ReportProblemModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import Foundation

class ReportProblemModel {
    var locationName: String!
    var categoryProblem: CategoryProblemModel!
    var medias: [MediaModel]!
    
    init(locationName: String, categoryProblem: CategoryProblemModel, medias: [MediaModel]) {
        self.locationName = locationName
        self.categoryProblem = categoryProblem
        self.medias = medias
    }
}
