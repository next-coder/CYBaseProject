//
//  CYBaseService.m
//  MoneyJar2
//
//  Created by Charry on 15/6/17.
//  Copyright (c) 2015年 Charry. All rights reserved.
//

#import "CYBaseService.h"

@implementation CYBaseService

+ (NSDictionary *)commonRequestParameters {
    
    return @{};
}

+ (CYResponseStatusModel *)checkResponse:(NSDictionary *)response {
    
    CYResponseStatusModel *status = nil;
    if (!response
        || ![response isKindOfClass:[NSDictionary class]]) {
        
        status = [CYResponseStatusModel responseStatusFromCode:-1320
                                                       message:@"网络出错啦"];
        
    } else {
        
        status = [CYResponseStatusModel modelFromDictionary:response];
    }
    
    return status;
}

@end
