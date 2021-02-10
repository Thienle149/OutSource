//
//  ResponseModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/21/21.
//

import Foundation
class ResponseModel {
    var isOk: Bool!
    var messageCode: String?
    var messageText: String?
    var messageError: String?
    var data: [String: Any]?
    
    init(dict: [String: Any?]) {
        self.isOk = dict["isOk"] as? Bool ?? false
        self.messageCode = dict["messageCode"] as? String
        self.messageText = dict["messageText"] as? String
        self.messageError = dict["messageError"] as? String
        self.data = dict["data"] as? [String: Any]
    }
}
