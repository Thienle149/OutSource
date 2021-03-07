//
//  BaseVM.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/20/21.
//

import Foundation
import UIKit
import Alamofire

class BaseAPIVM: BaseAPIVMProtocol {
    
    var manager: APIManager
    
    var controller: BaseVC
    
    init(controller: BaseVC) {
        self.controller = controller
        self.manager = Protecter.APIManager.getInstance()
    }
}
