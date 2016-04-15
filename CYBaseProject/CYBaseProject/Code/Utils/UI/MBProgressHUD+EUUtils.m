//
//  MBProgressHUD+EUUtils.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/11/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "MBProgressHUD+EUUtils.h"

@implementation MBProgressHUD (EUUtils)

#pragma mark - show message
+ (MB_INSTANCETYPE)showMessage:(NSString *)message
                        toView:(UIView *)view
                      animated:(BOOL)animated {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    [view addSubview:hud];
    [hud show:animated];
    [hud hide:animated afterDelay:2.f];
    return hud;
}

+ (MB_INSTANCETYPE)showMessageInWindow:(NSString *)message
                              animated:(BOOL)animated {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return [self showMessage:message toView:window animated:animated];
}

#pragma mark -  show in key window
+ (MB_INSTANCETYPE)showHUDAddedToKeyWindowAnimated:(BOOL)animated {
    
    return [MBProgressHUD showHUDAddedTo:[MBProgressHUD applicationKeyWindow]
                                animated:animated];
}

+ (BOOL)hideHUDForKeyWindowAnimated:(BOOL)animated {
    
    return [MBProgressHUD hideHUDForView:[MBProgressHUD applicationKeyWindow]
                                animated:animated];
}

+ (NSUInteger)hideAllHUDsForKeyWindowAnimated:(BOOL)animated {
    
    return [MBProgressHUD hideAllHUDsForView:[MBProgressHUD applicationKeyWindow]
                                    animated:animated];
}

+ (MB_INSTANCETYPE)HUDForKeyWindow {
    
    return [MBProgressHUD HUDForView:[MBProgressHUD applicationKeyWindow]];
}

+ (NSArray *)allHUDsForKeyWindow {
    
    return [MBProgressHUD allHUDsForView:[MBProgressHUD applicationKeyWindow]];
}

+ (UIWindow *)applicationKeyWindow {
    
    return [UIApplication sharedApplication].keyWindow;
}

@end
