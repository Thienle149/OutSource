//
//  DetailHistoryProblemVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/8/21.
//

import UIKit

class DetailHistoryProblemVC: BaseVC {

    @IBOutlet weak var handlerView: UIView!
    @IBOutlet weak var imageProblemView: UIView!
    @IBOutlet weak var recordProblemView: UIView!
    @IBOutlet weak var lblTitleConfirm: UILabel!
    @IBOutlet weak var lineHandleView: UIView!
    @IBOutlet weak var lineImageProblemView: UIView!
    @IBOutlet weak var lineRecordView: UIView!
    @IBOutlet weak var btnStatus: UIButton!
    
    
    
    public var isScreenHandled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    //MARK: Private
    private func config() {
        self.createUI(screenHandled: self.isScreenHandled)
    }
    
    private func createUI(screenHandled: Bool) {
        self.handlerView.isHidden = !screenHandled
        self.imageProblemView.isHidden = !screenHandled
        self.recordProblemView.isHidden = !screenHandled
        self.lineHandleView.isHidden = !screenHandled
        self.lineRecordView.isHidden = !screenHandled
        self.lineImageProblemView.isHidden = !screenHandled
        
        self.lblTitleConfirm.text = screenHandled ? "Người xác nhận" : "Người hủy"
        
        let titleStatus = screenHandled ? "Đã xử lý" : "Đã hủy"
        let titleColorStatus = screenHandled ? UIColor(hexString: "23874B") : UIColor(hexString: "9D9D9D")
        self.btnStatus.setTitle(titleStatus, for: .normal)
        self.btnStatus.setTitleColor(titleColorStatus, for: .normal)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.pop()
    }
    
}
