//
//  UIFont+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var screenFactor: CGFloat {
        
        get {
            
            return UIScreen.mainScreen().bounds.size.width / 320.0
        }
    }
    
    class func systemFontOfSize(fontSize: CGFloat, adaptScreen: Bool) -> UIFont {
        
        return self.systemFontOfSize(self.fontSize(fontSize, adaptScreen: adaptScreen))
    }
    
    class func systemFontOfSize(fontSize: CGFloat, adaptFontFor6Plus: Bool) -> UIFont {
        
        return systemFontOfSize(fontSize,
                                adaptScreen: (adaptFontFor6Plus && UIScreen.mainScreen().is6PlusScreen))
    }
    
    class func boldSystemFontOfSize(fontSize: CGFloat, adaptScreen: Bool) -> UIFont {
        
        return self.boldSystemFontOfSize(self.fontSize(fontSize, adaptScreen: adaptScreen))
    }
    
    class func boldSystemFontOfSize(fontSize: CGFloat, adaptFontFor6Plus: Bool) -> UIFont {
        
        return boldSystemFontOfSize(fontSize,
                                    adaptScreen: (adaptFontFor6Plus && UIScreen.mainScreen().is6PlusScreen))
    }
    
    class func fontSize(fontSize: CGFloat, adaptScreen: Bool) -> CGFloat {
        
        if adaptScreen {
            
            return fontSize * self.screenFactor
        } else {
            
            return fontSize
        }
    }
    
    class func fontSize(fontSize: CGFloat, adaptFontFor6Plus:Bool) -> CGFloat {
        
        return self.fontSize(fontSize,
                             adaptScreen: (adaptFontFor6Plus && UIScreen.mainScreen().is6PlusScreen))
    }
}
