//
//  UIImage+EUUtils.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/14/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "UIImage+CYUtils.h"

@implementation UIImage (CYUtils)

- (UIImage *)imageByScaleImageToSize:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScaleImageWidthTo:(CGFloat)width {
    
    CGSize originSize = self.size;
    
    CGSize newSize = CGSizeMake(width, width * originSize.height / originSize.width);
    
    return [self imageByScaleImageToSize:newSize];
}

- (UIImage *)imageByScaleImageHeightTo:(CGFloat)height {
    
    CGSize originSize = self.size;
    
    CGSize newSize = CGSizeMake(height * originSize.width / originSize.height, height);
    return [self imageByScaleImageToSize:newSize];
}

@end
