//
//  EUTitleDetailTextCell.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/12/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYBaseTableViewCell.h"

@interface CYTitleDetailTextCell : CYBaseTableViewCell

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *detailLabel;

@property (nonatomic, weak) UIImageView *leftIconImageView;
@property (nonatomic, weak) UIImageView *accessoryImageView;

@property (nonatomic, assign) BOOL hidesAccessory;
@property (nonatomic, assign) BOOL hidesLeftIcon;

@end
