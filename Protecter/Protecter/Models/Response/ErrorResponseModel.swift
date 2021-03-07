//
//  ErrorModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import Foundation

class ErrorResponseModel {
    
    var messageCode: String!
    var messageText: String!
    var messageError: String!
    
    init(code: String, messageText: String, messageError: String) {
        self.messageCode = code
        self.messageText = messageText
        self.messageError = messageError
    }
    
    convenience init(response: ResponseModel) {
        self.init(code: response.messageCode ?? "69",messageText: response.messageText ?? "69", messageError: response.messageError ?? "69")
    }
    
    convenience init(systemMessage: ErrorSystem) {
        self.init(code: systemMessage.getCode(),messageText: systemMessage.rawValue, messageError: systemMessage.rawValue)
    }
}
