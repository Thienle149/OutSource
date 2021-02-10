//
//  Storyboard+ext.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/22/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    func instantiateViewController(screen: ScreenApp) -> UIViewController?{
        return  self.instantiateViewController(withIdentifier: screen.rawValue )
    }
}
