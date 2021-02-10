//
//  APIManager.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/22/21.
//

import Foundation


class APIManager {
    
    private static var instance: APIManager!
    
    public static func getInstance() -> APIManager {
        if(instance == nil) {
            instance = APIManager()
        }
        return instance;
    }
    
    public func call(path: String, method: HTTPMethod, params: [String: Any]?) {
        
    }
    
}
