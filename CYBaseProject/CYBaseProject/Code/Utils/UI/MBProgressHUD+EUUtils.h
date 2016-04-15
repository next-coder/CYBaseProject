//
//  MBProgressHUD+EUUtils.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (EUUtils)

// show message
+ (MB_INSTANCETYPE)showMessage:(NSString *)message
                        toView:(UIView *)view
                      animated:(BOOL)animated;
+ (MB_INSTANCETYPE)showMessageInWindow:(NSString *)message
                              animated:(BOOL)animated;

// util methods for application key window
+ (MB_INSTANCETYPE)showHUDAddedToKeyWindowAnimated:(BOOL)animated;
+ (BOOL)hideHUDForKeyWindowAnimated:(BOOL)animated;
+ (NSUInteger)hideAllHUDsForKeyWindowAnimated:(BOOL)animated;
+ (MB_INSTANCETYPE)HUDForKeyWindow;
+ (NSArray *)allHUDsForKeyWindow;

@end
