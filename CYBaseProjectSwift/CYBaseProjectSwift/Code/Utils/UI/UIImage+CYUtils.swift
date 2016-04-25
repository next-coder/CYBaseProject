//
//  UIImage+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageByScaleImageToSize(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.drawInRect(CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func imageByScaleImageWidth(toWidth: CGFloat) -> UIImage {
        
        let originSize = self.size
        let newSize = CGSize(width: toWidth, height: originSize.height)
        
        return self.imageByScaleImageToSize(newSize)
    }
    
    func imageByScaleImageHeight(toHeight: CGFloat) -> UIImage {
        
        let originSize = self.size
        let newSize = CGSize(width: originSize.width, height: toHeight)
        
        return self.imageByScaleImageToSize(newSize)
    }
    
    class func resizableImage(named name: String, capInsets: UIEdgeInsets) -> UIImage? {
        
        return UIImage(named: name)?.resizableImageWithCapInsets(capInsets)
    }
    
}
