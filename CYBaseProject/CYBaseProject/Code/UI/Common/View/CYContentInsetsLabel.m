//
//  XNContentInsetsLabel.m
//  MoneyJar2
//
//  Created by HuangQiSheng on 8/14/15.
//  Copyright (c) 2015 GK. All rights reserved.
//

#import "CYContentInsetsLabel.h"

@implementation CYContentInsetsLabel

- (void)drawTextInRect:(CGRect)rect {
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _contentInsets)];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    
    _contentInsets = contentInsets;
}

@end
