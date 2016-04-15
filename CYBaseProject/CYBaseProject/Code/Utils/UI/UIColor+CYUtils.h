//
//  UIColor+EUUtils.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CYUtils)

#pragma mark - Color from Hex
+ (instancetype)colorFromHexString:(NSString *)hexString;

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red
                         G:(CGFloat)green
                         B:(CGFloat)blue
                         A:(CGFloat)alpha;

@end
