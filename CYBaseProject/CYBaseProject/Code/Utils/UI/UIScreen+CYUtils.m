//
//  UIScreen+CYUtils.m
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import "UIScreen+CYUtils.h"

@implementation UIScreen (CYUtils)

- (CYScreenType)screenType {
    
    CGFloat screenWidth = self.bounds.size.width;
    CGFloat screenHeight = self.bounds.size.height;
    // 1 point Deviation
    if (screenWidth <= 321) {
        
        if (screenHeight <= 481) {
            
            return CYScreenType3_5;
        } else {
            
            return CYScreenType4;
        }
    } else if (screenWidth <= 375) {
        
        return CYScreenType4_7;
    } else if (screenWidth <= 414) {
        
        return CYScreenType5_5;
    } else if (screenWidth <= 769) {
        
        return CYScreenType_iPad;
    } else if (screenWidth <= 1025) {
        
        return CYScreenType12_9;
    } else {
        
        return CYScreenType_unknown;
    }
}

- (BOOL)is6PlusScreen {
    
    return (self.screenType == CYScreenType5_5);
}

@end
