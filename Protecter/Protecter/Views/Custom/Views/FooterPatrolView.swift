//
//  footerPatrolView.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/14/21.
//

import UIKit

class FooterPatrolView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnPatrol: UIButton!
    
    public var action: ((_ button: UIButton) -> Void)!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("FooterPatrolView", owner: self, options: nil)
        self.addSubview(contentView)
        Utils.setConstraintFull(with: contentView, parent: self)
        
        btnPatrol.titleLabel?.underline()
    }

    @IBAction func actionPatrol(_ sender: Any) {
        action(sender as! UIButton)
    }
}
