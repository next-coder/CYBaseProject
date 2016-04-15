//
//  UITextField+EUUtils.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "UITextField+CYUtils.h"

@implementation UITextField (CYUtils)

+ (UITextField *)textFieldWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    
    return [self textFieldWithFont:font
                         textColor:textColor
                          leftView:nil
                         rightView:nil
                       placeholder:nil];
}

+ (UITextField *)textFieldWithFont:(UIFont *)font
                         textColor:(UIColor *)textColor
                          leftView:(UIView *)leftView
                         rightView:(UIView *)rightView
                       placeholder:(NSString *)placeholder {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor clearColor];
    textField.font = font;
    textField.textColor = textColor;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (leftView) {
        
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    if (rightView) {
        
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    textField.placeholder = placeholder;
    return textField;
}

@end
