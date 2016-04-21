//
//  UIFont+CYUtils.m
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import "UIFont+CYUtils.h"

#import "UIScreen+CYUtils.h"

@implementation UIFont (CYUtils)

+ (CGFloat)screenAdaptFactor {
    
    static CGFloat standardWidth = 320.f;
    static CGFloat factor = 0;
    
    if (factor == 0) {
        
        factor = [UIScreen mainScreen].bounds.size.width / standardWidth;
    }
    return factor;
}

+ (instancetype)screenAdapt6PlusOnlySystemFontOfSize:(CGFloat)fontSize {
    
    return [self screenAdaptSystemFontOfSize:fontSize
                              adapt6PlusOnly:YES];
}

+ (instancetype)screenAdaptSystemFontOfSize:(CGFloat)fontSize
                             adapt6PlusOnly:(BOOL)adapt6PlusOnly {
    
    if (!adapt6PlusOnly
        || [UIScreen mainScreen].is6PlusScreen) {
        
        return [UIFont systemFontOfSize:(fontSize * [self screenAdaptFactor])];
    } else {
        
        return [UIFont systemFontOfSize:fontSize];
    }
}

+ (instancetype)screenAdapt6PlusOnlyBoldSystemFontOfSize:(CGFloat)fontSize {
    
    return [self screenAdaptBoldSystemFontOfSize:fontSize
                                  adapt6PlusOnly:YES];
}

+ (instancetype)screenAdaptBoldSystemFontOfSize:(CGFloat)fontSize
                                 adapt6PlusOnly:(BOOL)adapt6PlusOnly {
    
    if (!adapt6PlusOnly
        || [UIScreen mainScreen].is6PlusScreen) {
        
        return [UIFont boldSystemFontOfSize:(fontSize * [self screenAdaptFactor])];
    } else {
        
        return [UIFont boldSystemFontOfSize:fontSize];
    }
}

+ (CGFloat)screenAdaptFontSizeWith:(CGFloat)fontSize {
    
    return [self screenAdaptFontSizeWith:fontSize
                          adapt6PlusOnly:NO];
}

+ (CGFloat)screenAdapt6PlustOnlyFontSizeWith:(CGFloat)fontSize {
    
    return [self screenAdaptFontSizeWith:fontSize
                          adapt6PlusOnly:YES];
}

+ (CGFloat)screenAdaptFontSizeWith:(CGFloat)fontSize
                    adapt6PlusOnly:(BOOL)adapt6PlusOnly {
    
    if (!adapt6PlusOnly
        || [UIScreen mainScreen].is6PlusScreen) {
        
        return (fontSize * [self screenAdaptFactor]);
    } else {
        
        return fontSize;
    }
}

@end
