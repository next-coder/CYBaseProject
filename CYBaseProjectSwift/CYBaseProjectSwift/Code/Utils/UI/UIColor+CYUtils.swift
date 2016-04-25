//
//  UIColor+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorFromHexString(let hexString: String) -> UIColor {
        
        let hexString1 = hexString.stringByReplacingOccurrencesOfString("#", withString: "")
        
        var rgbValue: UInt32  = 0
        let scanner = NSScanner(string: hexString1)
        scanner.scanHexInt(&rgbValue)
        
        return UIColor(R: CGFloat(((rgbValue & 0xFF0000) >> 16)), G: CGFloat(((rgbValue & 0x00FF00) >> 16)), B: CGFloat(((rgbValue & 0x0000FF) >> 16)), alpha: 1.0)
    }
    
    convenience init(R red: CGFloat, G green: CGFloat, B blue: CGFloat, alpha: CGFloat) {
        
        self.init(red: red / 255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
