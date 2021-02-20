//
//  APIManager.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/22/21.
//

import Foundation
import Alamofire

protocol APIManagerDelegate {
    func APIManager(path: ServerAPI, method: HTTPMethod, params: [String: Any]?, tag: String, completed json: [String: Any?]?)
}

class APIManager {
    
    private static var instance: APIManager!
    
    public var delegate: APIManagerDelegate?
    
    private let headers: HTTPHeaders = [
        "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
        "Accept": "application/json"
    ]
    
    public static func getInstance() -> APIManager {
        if(instance == nil) {
            instance = APIManager()
        }
        return instance;
    }
    
    public func call(path: ServerAPI, method: HTTPMethod, params: [String: Any]?, controller: BaseVC) {
        let urlString = URL(string: ServerAPI.urlHost.rawValue)?.appendingPathComponent(path.rawValue)
        
        controller.showLoading()
        
        AF.request(urlString!.absoluteString, method: method, parameters: params, headers: headers).responseJSON { [weak self] (result) in
            if let dict = result.value as? [String: Any?] {
                let response = ResponseModel(dict: dict)
                if response.isOk {
                    self?.delegate?.APIManager(path: path, method: method, params: params, tag: "", completed: response.data)
                } else {
                    controller.showToast(response.messageText ?? "Lỗi hệ thống")
                }
                
                controller.hideLoading()
            }
        }
    }
    
}
