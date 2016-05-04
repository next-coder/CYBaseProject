//
//  String+Utils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension String {
    
    func localizedStringForInternational(comment: String) -> String {
        
        return NSLocalizedString(self, comment: comment)
    }
    
    func floatValue() -> Float {
        
        return (self as NSString).floatValue
    }
    
    func stringByAppendingPathComponent(pathComponnent: String) -> String {
        
        let selfHasFlash = self.hasSuffix("/")
        let pathComponentHasFlash = pathComponnent.hasPrefix("/")
        if selfHasFlash
            && pathComponentHasFlash {
            
            // 都有/
            let path = pathComponnent.substringFromIndex(pathComponnent.startIndex.successor())
            return self.stringByAppendingString(path)
        } else if !selfHasFlash
                    && !pathComponentHasFlash {
            
            // 都没有/
            return self.stringByAppendingFormat("%@%@", "/", pathComponnent)
        } else {
            
            // 有一个有/
            return self.stringByAppendingString(pathComponnent)
        }
    }
}
