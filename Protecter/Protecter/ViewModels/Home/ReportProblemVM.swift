//
//  ReportProblemVM.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import Foundation
import Alamofire

class ReportProblemVM: BaseAPIVM, ReportProblemProtocol {
    
    var selectedAreaIndex: Int = 0
    
    var selectedCategoryProblemIndex: Int = -1
    
    
    func getAreas(output: @escaping(([String])-> Void)) {
        let areas = ["Chung cư Khang Điền - Lô A - Lầu 1",
                             "Chung cư Khang Điền - Lô A - Lầu 2",
                             "Chung cư Khang Điền - Lô A - Lầu 3",
                             "Chung cư Khang Điền - Lô A - Lầu 4",
                             "Chung cư Khang Điền - Lô A - Lầu 5",
                             "Chung cư Khang Điền - Lô A - Lầu 6",
                             "Chung cư Khang Điền - Lô A - Lầu 7"
        ]
        output(areas)
    }
    
    func sendSOS(reportProblem: ReportProblemModel, complete: @escaping (() -> Void)) {
       complete()
    }
    
    func convertReportProblem(areas: [String], categoriesReportProblem: [CategoryProblemModel], medias: [MediaModel]) -> ReportProblemModel? {
        if selectedCategoryProblemIndex != -1 {
            return ReportProblemModel(locationName: areas[selectedAreaIndex], categoryProblem: categoriesReportProblem[selectedCategoryProblemIndex], medias: medias)
        }
        return nil
    }
}
