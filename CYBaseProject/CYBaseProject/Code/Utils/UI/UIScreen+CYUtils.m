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
    
    CGFloat screenWidth = MIN(self.bounds.size.width, self.bounds.size.height);
    CGFloat screenHeight = MAX(self.bounds.size.width, self.bounds.size.height);
    
    if (screenWidth == 320
        && screenHeight == 480) {
        
        return CYScreenType3_5;
    } else if (screenWidth == 320
               && screenHeight == 568) {
        
        return CYScreenType4;
    } else if (screenWidth == 375
               && screenHeight == 667) {
        
        return CYScreenType4_7;
    } else if (screenWidth == 414
               && screenHeight == 736) {
        
        return CYScreenType5_5;
    } else if (screenWidth == 768
               && screenHeight == 1024) {
        
        return CYScreenType_iPad;
    } else if (screenWidth == 1024
               && screenHeight == 1366) {
        
        return CYScreenType12_9;
    } else {
        
        return CYScreenType_unknown;
    }
}

- (BOOL)is6PlusScreen {
    
    return (self.screenType == CYScreenType5_5);
}

@end
