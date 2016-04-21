//
//  UIDevice+CYUtils.m
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import "UIDevice+CYUtils.h"

@implementation UIDevice (CYUtils)

@dynamic floatSystemVersion;
@dynamic systemIsIos8AndLater;
@dynamic systemIsIos9AndLater;

- (CGFloat)floatSystemVersion {
    
    return [[UIDevice currentDevice].systemVersion floatValue];
}

- (BOOL)systemIsIos8AndLater {
    
    return (self.floatSystemVersion >= 8);
}

- (BOOL)systemIsIos9AndLater {
    
    return (self.floatSystemVersion >= 9);
}

@end
