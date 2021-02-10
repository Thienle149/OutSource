//
//  ImageExtension.swift
//  Glowie
//
//  Created by admin on 12/25/19.
//  Copyright © 2019 Glowie. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeImageToMaximumSize() -> UIImage {
        let maximumSize: CGFloat = 1080
        
        if size.width > maximumSize {
            return resizeToWidth(width: maximumSize)
        }
        
        return self
    }
    
    func resizeImageToThumbnailSize() -> UIImage {
        let maximumSize: CGFloat = 750
        
        if size.width > maximumSize {
            return resizeToWidth(width: maximumSize)
        }
        
        return self
    }
    
    func resizeToWidth(width:CGFloat)-> UIImage {
        let height = CGFloat(ceil(width * size.height / size.width))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height)))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
