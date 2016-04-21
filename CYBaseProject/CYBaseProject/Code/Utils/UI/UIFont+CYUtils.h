//
//  UIFont+CYUtils.h
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (CYUtils)

// normal system font with adapt screen
+ (instancetype)screenAdapt6PlusOnlySystemFontOfSize:(CGFloat)fontSize;
+ (instancetype)screenAdaptSystemFontOfSize:(CGFloat)fontSize
                             adapt6PlusOnly:(BOOL)adapt6PlusOnly;

// bold system font with adapt screen
+ (instancetype)screenAdapt6PlusOnlyBoldSystemFontOfSize:(CGFloat)fontSize;
+ (instancetype)screenAdaptBoldSystemFontOfSize:(CGFloat)fontSize
                                 adapt6PlusOnly:(BOOL)adapt6PlusOnly;

// font size
+ (CGFloat)screenAdaptFontSizeWith:(CGFloat)fontSize;
+ (CGFloat)screenAdapt6PlustOnlyFontSizeWith:(CGFloat)fontSize;
+ (CGFloat)screenAdaptFontSizeWith:(CGFloat)fontSize
                    adapt6PlusOnly:(BOOL)adapt6PlusOnly;

@end
