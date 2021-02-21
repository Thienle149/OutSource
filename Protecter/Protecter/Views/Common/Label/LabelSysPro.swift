//
//  LabelRegularPro.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/21/21.
//

import Foundation
import UIKit

class LabelSysPro: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
    }
}

class LabelRegularSysPro: LabelSysPro {
    
    override func commonInit() {
        self.font = Utils.fontProRegular(size: self.font.pointSize)
    }
    
}

class LabelMediumSysPro: LabelSysPro {
    
    override func commonInit() {
        self.font = Utils.fontProMedium(size: self.font.pointSize)
    }
}

class LabelBoldSysPro: LabelSysPro {
    
    override func commonInit() {
        self.font = Utils.fontProBold(size: self.font.pointSize)
    }
}

class LabelTitleBarSysPro: LabelSysPro {
    
    override func commonInit() {
        self.font = Utils.fontProBold(size: 24)
    }
}
