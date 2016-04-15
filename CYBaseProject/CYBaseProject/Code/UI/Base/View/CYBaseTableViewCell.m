//
//  EUBaseTableViewCell.m
//  Euaaaios
//
//  Created by juanjuanHuang on 16/4/10.
//  Copyright © 2016年 euaaa. All rights reserved.
//

#import "CYBaseTableViewCell.h"

@implementation CYBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.separatorInset = UIEdgeInsetsZero;
        if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
            
            [self setPreservesSuperviewLayoutMargins:NO];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}

@end
