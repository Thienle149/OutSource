//
//  APIController.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/20/21.
//

import Foundation
import Alamofire


class APIController<T: BaseAPIVM>: BaseVC {
   
    //MARK: vm: ViewModel
    var vm: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
