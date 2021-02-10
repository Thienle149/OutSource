//
//  LayerExtension.swift
//  Glowie
//
//  Created by admin on 11/2/19.
//  Copyright © 2019 Glowie. All rights reserved.
//

import UIKit

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    static func createGradientLayer(_ size: CGSize, _ fromColor: UIColor, _ toColor: UIColor, _ startPoint: CGPoint, _ endPoint: CGPoint ) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0,
                       width: size.width,
                       height: size.height)
        gradient.colors = [fromColor.cgColor,
                  toColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        return gradient
    }
}
