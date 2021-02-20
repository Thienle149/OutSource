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
    
    public func login(phone: String, password: String, success: @escaping((Bool, ErrorLogin?) -> Void)) {
        if phone == "0389382432" {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        Utils.readFileJson(fileName: "userLogin") { (dict) in
            let response = ResponseModel(dict: dict)
            if response.isOk {
                let user = UserModel(dict: response.data!)
                Contants.global.user = user
                Utils.saveSessionApp(user: user)
                success(true, nil)
//                let mainVC = MainTabBarVC()
//                self.push(mainVC)
            } else {
                success(false, .notSuccess)
            }
        }}} else if phone == "0969144852" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            Utils.readFileJson(fileName: "leadProtecter") { (dict) in
                let response = ResponseModel(dict: dict)
                if response.isOk {
                    let user = UserModel(dict: response.data!)
                    Contants.global.user = user
                    Utils.saveSessionApp(user: user)
                    success(true, nil)
                } else {
                    success(false, .notSuccess)
                }
            }}
        }
    }
    
    override func handleAPI(path: ServerAPI, method: HTTPMethod, params: [String : Any]?, tag: String, completed json: [String : Any?]?) {
        if path == .login {
            
        }
    }
}
