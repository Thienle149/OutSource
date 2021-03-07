//
//  APIManager.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/22/21.
//

import Foundation
import Alamofire

//protocol APIManagerDelegate {
//    func APIManager(path: ServerAPI, method: HTTPMethod, params: [String: Any]?, tag: String, completed json: [String: Any?]?)
//}

class APIManager {
    
    private static var instance: APIManager!
    
    //    public var delegate: APIManagerDelegate?
    
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
    
    public func call(path: ServerAPI, method: HTTPMethod, params: [String: Any]?, controller: BaseVC, complete: @escaping(([String: Any]?, ErrorResponseModel?) -> Void)) {
        let urlString = URL(string: ServerAPI.urlHost.rawValue)?.appendingPathComponent(path.rawValue)
        
        controller.showLoading()
        // background thread
        DispatchQueue(label: "QUEUE_CALL_API", attributes: .concurrent).async {
            AF.request(urlString!.absoluteString, method: method, parameters: params, headers: self.headers).responseJSON { (result) in
                //main thread
                DispatchQueue.main.async {
                    controller.hideLoading()
                    if let dict = result.value as? [String: Any?] {
                        let response = ResponseModel(dict: dict)
                        if response.isOk {
                            complete(response.data, nil)
                        } else {
                            controller.showToast(response.messageText ?? ErrorSystem.error1001.rawValue)
                            let errorResponse = ErrorResponseModel(response: response)
                            complete(nil, errorResponse)
                        }
                    } else {
                        controller.showToast(ErrorSystem.error1002.rawValue)
                        let errorResponse = ErrorResponseModel(systemMessage: .error1002)
                        complete(nil, errorResponse)
                    }
                }
                
            }
        }
    }
}
