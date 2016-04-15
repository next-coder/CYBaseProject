//
//  EUTitleDetailTextCell.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/12/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYTitleDetailTextCell.h"

#import "UIColor+CYUtils.h"

@implementation CYTitleDetailTextCell

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
    [self addSubview:leftIcon];
    _leftIconImageView = leftIcon;
    
    UILabel *title = [[UILabel alloc] init];
    title.font = [UIFont boldSystemFontOfSize:16.f];
    title.textColor = [UIColor darkGrayColor];
    title.backgroundColor = [UIColor clearColor];
    [self addSubview:title];
    _titleLabel = title;
    
    UILabel *detail = [[UILabel alloc] init];
    detail.font = [UIFont boldSystemFontOfSize:14.f];
    detail.textColor = [UIColor darkGrayColor];
    detail.backgroundColor = [UIColor clearColor];
    detail.textAlignment = NSTextAlignmentRight;
    [self addSubview:detail];
    _detailLabel = detail;
    
    UIImageView *accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_arrow.png"]];
    accessory.backgroundColor = [UIColor clearColor];
    [self addSubview:accessory];
    _accessoryImageView = accessory;
}

- (void)createConstraintsForSubviews {
    
    [_leftIconImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_leftIconImageView.right).offset(10);
        make.height.equalTo(20);
        make.centerY.equalTo(self);
    }];
    
    [_accessoryImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.width.equalTo(8);
        make.height.equalTo(13);
    }];
    
    [_detailLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_accessoryImageView.left).offset(-20);
        make.left.equalTo(_titleLabel.right).offset(10);
        make.centerY.equalTo(self);
        make.height.equalTo(20);
    }];
}

- (void)setHidesAccessory:(BOOL)hidesAccessory {
    
    if (_hidesAccessory != hidesAccessory) {
        
        _hidesAccessory = hidesAccessory;
        self.accessoryImageView.hidden = _hidesAccessory;
        
        [self.detailLabel remakeConstraints:^(MASConstraintMaker *make) {
            
            if (_hidesAccessory) {
                
                make.right.equalTo(self.contentView).offset(-10);
            } else {
                
                make.right.equalTo(_accessoryImageView.left).offset(-5);
            }
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
            make.height.equalTo(20);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

@end
