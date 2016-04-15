//
//  UILabel+EUUtils.m
//  Euaaaios
//
//  Created by juanjuanHuang on 16/4/10.
//  Copyright © 2016年 euaaa. All rights reserved.
//

#import "UILabel+CYUtils.h"

@implementation UILabel (CYUtils)

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

@end
