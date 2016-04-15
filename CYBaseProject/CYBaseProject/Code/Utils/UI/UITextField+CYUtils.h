//
//  UITextField+EUUtils.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CYUtils)

+ (UITextField *)textFieldWithFont:(UIFont *)font
                         textColor:(UIColor *)textColor;

+ (UITextField *)textFieldWithFont:(UIFont *)font
                         textColor:(UIColor *)textColor
                          leftView:(UIView *)leftView
                         rightView:(UIView *)rightView
                       placeholder:(NSString *)placeholder;

@end
