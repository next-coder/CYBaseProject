//
//  EUTitleLeftDetailCell.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/14/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYTitleLeftDetailCell.h"

@implementation CYTitleLeftDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createAndAddSubviews];
        [self createConstraintsForSubviews];
    }
    return self;
}

- (void)createAndAddSubviews {
    
    UILabel *title = [[UILabel alloc] init];
    title.font = [UIFont boldSystemFontOfSize:14.f];
    title.textColor = [UIColor grayColor];
    title.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:title];
    _titleLabel = title;
    
    UILabel *detail = [[UILabel alloc] init];
    detail.font = [UIFont boldSystemFontOfSize:16.f];
    detail.textColor = [UIColor darkGrayColor];
    detail.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:detail];
    _detailLabel = detail;
}

- (void)createConstraintsForSubviews {
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.mas_greaterThanOrEqualTo(80);
    }];
    
    [_detailLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_titleLabel.right).offset(10);
//        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
