//
//  UIScreen+CYUtils.h
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/21/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CYScreenType) {
    
    CYScreenType_unknown,
    // 3.5 inch screen， iPhone 4 and 4s series
    CYScreenType3_5,
    // 4 inch screen， iPhone 5 and 5s series
    CYScreenType4,
    // 4.7 inch screen， iPhone6 and later series
    CYScreenType4_7,
    // 5.5 inch screen， iPhone6 plus and later plus series
    CYScreenType5_5,
    // iPad mini, iPad and Air and pro mini series
    CYScreenType_iPad,
    // 12.9 inch screen， iPad pro series
    CYScreenType12_9
};

@interface UIScreen (CYUtils)

@property (nonatomic, assign, readonly) CYScreenType screenType;
@property (nonatomic, assign, readonly) BOOL is6PlusScreen;

@end
