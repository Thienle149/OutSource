//
//  BaseVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/21/21.
//

import UIKit
//import Firebase
import Toast_Swift
import SVProgressHUD

class BaseVC: UIViewController {
    
    //    var ref: DatabaseReference!
    //    var hub: MBProgressHUD!
    var observeNetwork: Any!
    var needMonitorNetwork: Bool = true
    var isHiddenNavigationBar: Bool = false {
        didSet {
            if self.isHiddenNavigationBar {
                self.hiddenNavigationBar()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.monitorNetwork()
        self.hideLoading()
//        NetworkService.getInstance().checkNow { (status) in
//            self.checkNowNetwork(status);
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let observe = observeNetwork, needMonitorNetwork {
            NotificationCenter.default.removeObserver(observe)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: Private
    
    private func config() {
        //        self.ref = Database.database().reference()
        self.overrideUserInterfaceStyle = .light
        self.navigationItem.leftBarButtonItem = btnBackItem()
    }
    
    private func monitorNetwork() {
        if(needMonitorNetwork) {
            observeNetwork = NotificationCenter.default.addObserver(forName: Notification.Name(Constants.NOTIFY_MONITOR_NETWORK), object: nil, queue: .main) { [weak self](notification) in
                if let statusNetwork = notification.object as? Bool {
                    self?.handleUIWhenNetworkChangeStatus(statusNetwork)
                }
            }
        }
    }
    
    //MARK: Public
    
    /// Function handleUIWhenNetworkChangeStatus (real time) when netwok change
    /// Excute when variable needMonitorNetwork = true
    /// Else if needMonitorNetwork = false. It not active
    public func handleUIWhenNetworkChangeStatus (_ status: Bool) {
        if status == false {
            self.view.isUserInteractionEnabled = false
        } else {
            self.view.isUserInteractionEnabled = true
        }
    }
    
    /// function checkNowork support when push new controller
    public func checkNowNetwork(_ status: Bool) {
        self.handleUIWhenNetworkChangeStatus(status)
    }
    
    public func presentAnimate(_ vc: UIViewController){
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    public func presentNoneAnimation(_ vc: UIViewController) {
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    
    public func dismissAnimate() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func dismissNoneAnimate() {
        self.dismiss(animated: false, completion: nil)
    }
    
    public func showToast(_ text: String) {
        self.view.makeToast(text)
    }
    
    public func showLoading() {
        SVProgressHUD.setForegroundColor(Constants.Color.main)
        SVProgressHUD.show()
        self.view.isUserInteractionEnabled = false
    }
    
    public func hideLoading() {
        self.view.isUserInteractionEnabled = true
        SVProgressHUD.dismiss()
    }
    
    public func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func pop(_ vc: UIViewController? = nil) {
        if let vc = vc {
            self.navigationController?.popToViewController(vc, animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    public func log(with text: String?, type: TypeLog = .unknow) {
        Utils.log(with: text, type: type)
    }
    
    func btnBackItem() -> UIBarButtonItem {
        let barBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), landscapeImagePhone: nil, style: .done, target: self,action: #selector(back))
        barBtn.image = UIImage(systemName: "chevron.left")
        barBtn.tintColor = .white
        return barBtn
    }
    
    @objc private func back() {
        self.pop()
    }
    
    func hiddenNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = UIColor.white
        appearance.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.standardAppearance = appearance
    }
}
