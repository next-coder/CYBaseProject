//
//  EUTitleDetailImageCell.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/12/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYTitleDetailImageCell.h"

@implementation CYTitleDetailImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createAndAddSubviews];
        [self createConstraintsForSubviews];
    }
    return self;
}

- (void)createAndAddSubviews {
    
    UIImageView *leftIcon = [[UIImageView alloc] init];
    leftIcon.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:leftIcon];
    _leftIconImageView = leftIcon;
    
    UILabel *title = [[UILabel alloc] init];
    title.font = [UIFont boldSystemFontOfSize:16.f];
    title.textColor = [UIColor darkGrayColor];
    title.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:title];
    _titleLabel = title;
    
    UIImageView *detail = [[UIImageView alloc] init];
    detail.backgroundColor = [UIColor clearColor];
    detail.layer.cornerRadius = 25;
    detail.clipsToBounds = YES;
    [self.contentView addSubview:detail];
    _detailImageView = detail;
    
    UIImageView *accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_arrow.png"]];
    accessory.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:accessory];
    _accessoryImageView = accessory;
}

- (void)createConstraintsForSubviews {
    
    [_leftIconImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_leftIconImageView.right).offset(10);
        make.right.equalTo(_detailImageView.left).offset(-5);
        make.height.equalTo(20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_accessoryImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(8);
    }];
    
    [_detailImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_accessoryImageView.left).offset(-5);
        make.width.equalTo(_detailImageView.height);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setHidesAccessory:(BOOL)hidesAccessory {
    
    if (_hidesAccessory != hidesAccessory) {
        
        _hidesAccessory = hidesAccessory;
        self.accessoryImageView.hidden = _hidesAccessory;
        
        [self.detailImageView remakeConstraints:^(MASConstraintMaker *make) {
            
            if (_hidesAccessory) {
                
                make.right.equalTo(self.contentView).offset(-5);
            } else {
                
                make.right.equalTo(_accessoryImageView.left).offset(-5);
            }
            make.width.equalTo(self.detailImageView.height);
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
    }
}

- (void)setHidesLeftIcon:(BOOL)hidesLeftIcon {
    
    if (_hidesLeftIcon != hidesLeftIcon) {
        
        _hidesLeftIcon = hidesLeftIcon;
        self.leftIconImageView.hidden = _hidesLeftIcon;
        
        [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
            
            if (_hidesLeftIcon) {
                
                make.left.equalTo(self.contentView).offset(10);
            } else {
                
                make.left.equalTo(self.leftIconImageView.right).offset(10);
            }
            make.right.equalTo(self.detailImageView.left).offset(-5);
            make.height.equalTo(20);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

@end
