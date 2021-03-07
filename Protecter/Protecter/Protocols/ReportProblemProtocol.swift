//
//  ReportProblemProtocol.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import Foundation

protocol ReportProblemProtocol {
    
    //Properties
    var selectedAreaIndex: Int {get set}
    var selectedCategoryProblemIndex: Int {get set}
    
    // fetch Data
    func getAreas(output: @escaping(([String])-> Void))
    
    // send Request
    func sendSOS(reportProblem: ReportProblemModel, complete: @escaping(()-> Void))
    
    // Utils
    func convertReportProblem(areas: [String], categoriesReportProblem: [CategoryProblemModel], medias: [MediaModel]) -> ReportProblemModel?
}
