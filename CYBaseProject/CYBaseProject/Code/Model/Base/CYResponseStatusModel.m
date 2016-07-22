//
//  XNResponseStatusModel.m
//  MoneyJar2
//
//  Created by HuangQiSheng on 15/6/17.
//  Copyright (c) 2015年 GK. All rights reserved.
//

#import "CYResponseStatusModel.h"

@implementation CYResponseStatusModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    if (self = [super initWithDictionary:dic]) {
        
        if (![NSDictionary cy_dictionaryIsEmptyOrNull:dic]) {
            
            _code = [dic cy_integerValueForKey:@"code"];
            _message = [dic cy_stringValueForKey:@"msg"];
        }
    }
    return self;
}

- (BOOL)success {
    
    return (self.code == 0);
}

+ (instancetype)responseStatusFromCode:(NSInteger)code
                               message:(NSString *)message {
    
    CYResponseStatusModel *status = [[CYResponseStatusModel alloc] init];
    status.code = code;
    status.message = message;
    return status;
}

@end
