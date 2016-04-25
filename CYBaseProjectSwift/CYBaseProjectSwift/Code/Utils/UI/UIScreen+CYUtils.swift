//
//  UIScreen+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

enum CYScreenType {
    
    case Screen_Unknown
    // 3.5 inch screen， iPhone 4 and 4s series
    case Screen_3_5
    // 4 inch screen， iPhone 5, 5s, se series
    case Screen_4
    // 4.7 inch screen， iPhone6 and later series
    case Screen_4_7
    // 5.5 inch screen， iPhone6 plus and later plus series
    case Screen_5_5
    // iPad mini, iPad and Air and pro mini series
    case Screen_iPad
    // 12.9 inch screen， iPad pro series
    case Screen_12_9
}

extension UIScreen {
    
    var screenType: CYScreenType {
        
        get {
            
            let screenWidth = min(self.bounds.size.width, self.bounds.size.height)
            let screenHeight = max(self.bounds.size.width, self.bounds.size.height)
            
            if screenWidth == 320
                && screenHeight == 480 {
                
                return .Screen_3_5
            } else if screenWidth == 320
                        && screenHeight == 568 {
                
                return .Screen_4
            } else if screenWidth == 375
                        && screenHeight == 667 {
                
                return .Screen_4_7
            } else if screenWidth == 414
                        && screenHeight == 736 {
                
                return .Screen_5_5
            } else if screenWidth == 768
                        && screenHeight == 1024 {
                
                return .Screen_iPad
            } else if screenWidth == 1024
                        && screenHeight == 1366 {
                
                return .Screen_12_9
            } else {
                
                return .Screen_Unknown
            }
        }
    }
    
    var is6PlusScreen: Bool {
        
        get {
            
            return (self.screenType == .Screen_5_5)
        }
    }
}
