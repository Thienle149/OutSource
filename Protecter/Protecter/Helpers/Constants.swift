//
//  Constants.swift
//  Market
//
//  Created by Lê Minh Thiện on 12/9/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    class HOME {
        static let NUMBER_ITEM_CATEGORY = 4
        static let SPACE_ITEM_CATEGORY = 30.0
    }
    
    class Color {
        static let lineActive = UIColor(hexString: "#29AAE1")
        static let lineInActive = UIColor(hexString: "#000000")
        
        static let active = UIColor(hexString: "#29AAE1")
        static let inActive = UIColor.gray
        
        static let main = UIColor(hexString: "#29AAE1")
    }
    
    static let NOTIFY_MONITOR_NETWORK = "NOTIFY_MONITOR_NETWORK"
    
    static let MONITOR_NETWORK_TIMER = 0.5
    
    static let modules: [ModuleModel] = [ModuleModel(title: "Đội", image: #imageLiteral(resourceName: "icons8-user-group-skin-type-7-96"), vc: Utils.storyboary(screen: .team, asClass: TeamVC.self)),
                                         ModuleModel(title: "Tuần Tra", image: #imageLiteral(resourceName: "icons8-security-guard-96"), vc: Utils.storyboary(screen: .module, asClass: ModuleVC.self)),
                                         ModuleModel(title: "Quản lý nhóm", image: #imageLiteral(resourceName: "icons8-attendance-80"), vc: Utils.storyboary(screen: .module, asClass: ModuleVC.self)),
                                         ModuleModel(title: "Lịch sử hoạt động", image: #imageLiteral(resourceName: "icons8-copybook-64"), vc: Utils.storyboary(screen: .module, asClass: ModuleVC.self)),
                                         ModuleModel(title: "Danh sách sự cố", image: #imageLiteral(resourceName: "icons8-high-risk-80"), vc: Utils.storyboary(screen: .problem, asClass: ProblemVC.self)),
                                         ModuleModel(title: "Hiện trạng", image: #imageLiteral(resourceName: "icons8-medium-priority-96"), vc: Utils.storyboary(screen: .state, asClass: StateVC.self))
    ]
    
    static let categoriesReportProblem: [CategoryProblemModel] = [CategoryProblemModel(title: "Cháy nổ", image: #imageLiteral(resourceName: "icons8-fire-96")),
                                                           CategoryProblemModel(title: "Gây rối", image: #imageLiteral(resourceName: "icons8-killing-100")),
                                                           CategoryProblemModel(title: "Người bị nạn", image: #imageLiteral(resourceName: "icons8-dying-100")),
                                                           CategoryProblemModel(title: "Khủng bố", image: #imageLiteral(resourceName: "icons8-explosive-100")),
                                                           CategoryProblemModel(title: "Cướp giật", image: #imageLiteral(resourceName: "icons8-killing-100")),
                                                           CategoryProblemModel(title: "Trộm cướp", image: #imageLiteral(resourceName: "icons8-bandit-100")),
                                                           CategoryProblemModel(title: "Mất trật tự", image: #imageLiteral(resourceName: "icons8-fire-96")),
                                                           CategoryProblemModel(title: "Sự cố khác", image: #imageLiteral(resourceName: "icons8-circled-menu-96")),
    ]
    
    static let global = GlobalModel()
}
