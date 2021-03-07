//
//  BaseAPIVMProtocol.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import Foundation
import Alamofire

protocol BaseAPIVMProtocol{
    var manager: APIManager {get set}
    var controller: BaseVC {get set}
}
