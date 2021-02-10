//
//  GestureExtension.swift
//  Glowie
//
//  Created by admin on 11/13/19.
//  Copyright © 2019 Glowie. All rights reserved.
//

import UIKit

extension UIView {
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "Tap"
        static var swipeUpGestureRecognizer = "SwipeUp"
        static var swipeDownGestureRecognizer = "SwipeDown"
        static var swipeLeftGestureRecognizer = "SwipeLeft"
        static var swipeRightGestureRecognizer = "RightSwipe"
        static var longPressGestureRecognizer = "LongPress"
    }
    
    fileprivate typealias Action = (() -> Void)?
    fileprivate typealias LongPressResponseClosure = (_ longPress: UILongPressGestureRecognizer) -> Void
    
    // Set Computed Property Type To a Closure for TapGestureRecognizerAction
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    @objc func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //Handle Tap
    @objc fileprivate func handleTapGesture() {
        if let action = self.tapGestureRecognizerAction {
            action?()
        }
    }
}
