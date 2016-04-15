//
//  UIColor+EUUtils.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "UIColor+CYUtils.h"

@implementation UIColor (CYUtils)

#pragma mark - Color from Hex
+ (instancetype)colorFromHexString:(NSString *)hexString {
    
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
