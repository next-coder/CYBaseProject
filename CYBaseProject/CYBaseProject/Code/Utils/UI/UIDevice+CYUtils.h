//
//  UIDevice+CYUtils.h
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CYUtils)

@property (nonatomic, assign, readonly) CGFloat floatSystemVersion;
@property (nonatomic, assign, readonly) BOOL systemIsIos8AndLater;
@property (nonatomic, assign, readonly) BOOL systemIsIos9AndLater;

@end
