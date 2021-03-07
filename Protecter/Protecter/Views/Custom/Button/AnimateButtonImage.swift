//
//  AnimateButtonImage.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 3/7/21.
//

import UIKit

class AnimateButtonImage: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(buttonTouchDown(sender:)), for: .touchDown)
        self.addTarget(self, action: #selector(buttonTouchUpInside(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonTouchDown(sender: Any) {
        let edge = self.imageEdgeInsets
        self.imageEdgeInsets = UIEdgeInsets(top: edge.top / 1.25, left: edge.left / 1.25, bottom: edge.bottom / 1.25, right: edge.right / 1.25)
    }
    
    @objc func buttonTouchUpInside(sender: Any) {
        UIView.animate(withDuration: 0.8) {
            let edge = self.imageEdgeInsets
            self.imageEdgeInsets = UIEdgeInsets(top: edge.top * 1.25, left: edge.left * 1.25, bottom: edge.bottom * 1.25, right: edge.right * 1.25)
        }
    }
}
