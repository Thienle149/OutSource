//
//  NeworkService.swift
//  FindAGift
//
//  Created by Lê Minh Thiện on 1/11/21.
//  Copyright © 2021 Lê Minh Thiện. All rights reserved.
//

import UIKit
import Network
import Reachability
class NetworkService: NSObject {
    
    override init() {
        super.init()
        monitorNetwork = NWPathMonitor()
    }
    
    private static var instance: NetworkService!
    private var monitorNetwork: NWPathMonitor!
    private var reach: Reachability!
    
    static func getInstance() -> NetworkService {
        if (NetworkService.instance == nil) {
            NetworkService.instance = NetworkService()
        }
        return NetworkService.instance;
    }
    
    func monitor()  {
        monitorNetwork.pathUpdateHandler = { path in
            DispatchQueue.global().asyncAfter(deadline: .now() + Contants.MONITOR_NETWORK_TIMER) {
                do {
                    self.reach = try Reachability(hostname: "www.apple.com")
                    var isNetwork = false
                    if self.reach.connection == .wifi {
                        isNetwork = true
                    } else if self.reach.connection == .cellular {
                        isNetwork = true
                    } else {
                        isNetwork = false
                    }
                    NotificationCenter.default.post(name: Notification.Name(Contants.NOTIFY_MONITOR_NETWORK), object: isNetwork);
                } catch {
                    print(error)
                }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitorNetwork.start(queue: queue)
    }
    
    func checkNow(handleUI: @escaping((Bool) -> Void))  {
        do {
            self.reach = try Reachability(hostname: "www.apple.com")
            var isNetwork = false
            if self.reach.connection == .wifi {
                isNetwork = true
            } else if self.reach.connection == .cellular {
                isNetwork = true
            } else {
                isNetwork = false
            }
            handleUI(isNetwork)
        } catch {
            print(error)
        }
    }
    
    func removeObserverNetWorkService(_ vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc)
    }
}

