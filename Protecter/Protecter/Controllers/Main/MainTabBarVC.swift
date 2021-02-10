//
//  HomeTabVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/23/21.
//

import UIKit

class MainTabBarVC: UITabBarController
{
    let home = Utils.storyboary(screen: .home, asClass: HomeVC.self)
    let notify = Utils.storyboary(screen: .notify, asClass: NotifyVC.self)
    let calendar = Utils.storyboary(screen: .calendar, asClass: CalendarVC.self)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        home.tabBarItem = UITabBarItem.init(title: "Trang chủ", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "focus_home"))
        notify.tabBarItem = UITabBarItem.init(title: "Thông báo", image: #imageLiteral(resourceName: "notify"), selectedImage: #imageLiteral(resourceName: "focus_notify"))
        calendar.tabBarItem = UITabBarItem.init(title: "Lịch", image: #imageLiteral(resourceName: "calendar"), selectedImage: #imageLiteral(resourceName: "focus_calendar"))
        
        self.viewControllers = [home, notify, calendar]
    }
}
