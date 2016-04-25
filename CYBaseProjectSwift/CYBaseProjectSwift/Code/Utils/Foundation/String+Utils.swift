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
}
