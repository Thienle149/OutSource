//
//  LoginVM.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/20/21.
//

import Foundation
import Alamofire

protocol ResponseLoginDelegate {
    func responseLogin()
}

class LoginVM: BaseAPIVM {
   
    public var delegate: ResponseLoginDelegate?
    
    public func validate(phone: String, password: String) -> (Bool, [ErrorLogin]) {
        var errors: [ErrorLogin] = []
        
        if !phone.isPhoneNumber {
            errors.append(.phone)
        }
        
        if password.isEmpty {
            errors.append(.password)
        }
        
        if errors.count == 0 {
            return (true, [])
        }
        
        return (false, errors)
    }
    
    public func login(phone: String, password: String, success: @escaping((Bool) -> Void)) {
        manager.call(path: .login, method: .post, params: nil, controller: controller)
    }
    
    override func handleAPI(path: ServerAPI, method: HTTPMethod, params: [String : Any]?, tag: String, completed json: [String : Any?]?) {
        if path == .login {
            
        }
    }
}
