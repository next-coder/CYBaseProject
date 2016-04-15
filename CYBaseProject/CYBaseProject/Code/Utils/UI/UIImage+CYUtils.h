//
//  UIImage+EUUtils.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/14/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CYUtils)

// 缩放到固定size，不一定等比
- (UIImage *)imageByScaleImageToSize:(CGSize)size;

// 等比缩放，
- (UIImage *)imageByScaleImageWidthTo:(CGFloat)width;
- (UIImage *)imageByScaleImageHeightTo:(CGFloat)height;

@end
