//
//  BaseVM.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/20/21.
//

import Foundation
import UIKit
import Alamofire

protocol BaseAPIVMProtocol{
    var manager: APIManager {get set}
    var controller: BaseVC {get set}

    func handleAPI(path: ServerAPI, method: HTTPMethod, params: [String : Any]?, tag: String, completed json: [String : Any?]?)
}

class BaseAPIVM: BaseAPIVMProtocol {
    
    var manager: APIManager
    
    var controller: BaseVC
    
    init(controller: BaseVC) {
        self.controller = controller
        self.manager = Protecter.APIManager.getInstance()
        self.manager.delegate = self
    }
    
    func handleAPI(path: ServerAPI, method: HTTPMethod, params: [String : Any]?, tag: String, completed json: [String : Any?]?) {
        
    }
    
}

extension BaseAPIVM: APIManagerDelegate {
    func APIManager(path: ServerAPI, method: HTTPMethod, params: [String : Any]?, tag: String, completed json: [String : Any?]?) {
        self.handleAPI(path: path, method: method, params: params, tag: tag, completed: json)
    }
    
    
}
