//
//  BaseButtonBarPagerTabStripVC.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/10/21.
//

import Foundation
import XLPagerTabStrip

class BaseButtonBarPagerTabStripVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = Contants.Color.main
        settings.style.buttonBarItemBackgroundColor = Contants.Color.main
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        settings.style.buttonBarItemFont = UIFont(name: "Roboto-Medium", size: 18) ?? UIFont.systemFont(ofSize: 12)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        settings.style.buttonBarLeftContentInset = 20
        settings.style.buttonBarRightContentInset = 20
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = UIColor(red: 138/255.0, green: 138/255.0, blue: 144/255.0, alpha: 1.0)
        }
        super.viewDidLoad()
    }
}
