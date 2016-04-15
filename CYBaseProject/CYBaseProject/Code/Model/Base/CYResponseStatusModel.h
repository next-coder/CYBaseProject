//
//  XNResponseStatusModel.h
//  MoneyJar2
//
//  Created by HuangQiSheng on 15/6/17.
//  Copyright (c) 2015年 GK. All rights reserved.
//

#import "CYBaseModel.h"

@interface CYResponseStatusModel : CYBaseModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *message;

@property (nonatomic, assign, readonly) BOOL success;

+ (instancetype)responseStatusFromCode:(NSInteger)code
                               message:(NSString *)message;

@end
