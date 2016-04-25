//
//  UILabel+CYUtils.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(font: UIFont, textColor: UIColor) {
        
        self.init(frame: CGRectZero)
        self.font = font
        self.textColor = textColor
    }
    
}
