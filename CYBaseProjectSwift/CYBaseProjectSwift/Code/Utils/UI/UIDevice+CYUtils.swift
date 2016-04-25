//
//  UIDevice+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var floatSystemVersion: Float {
        
        get {
            
            return UIDevice.currentDevice().systemVersion.floatValue()
        }
    }
    
    var systemIsIOS8Andlater: Bool {
        
        get {
            
            return (self.floatSystemVersion >= 8)
        }
    }
    
    var systemIsIOS9AndLater: Bool {
        
        get {
            
            return (self.floatSystemVersion >= 9)
        }
    }
}
