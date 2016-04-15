//
//  EUPageModel.m
//  Euaaaios
//
//  Created by HuangQiSheng on 4/13/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYPageModel.h"

@implementation CYPageModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    if (self = [super initWithDictionary:dic]) {
        
        if (![NSDictionary dictionaryIsEmptyOrNull:dic]) {
            _total = [dic cy_integerValueForKey:@"total"];
            _page = [dic cy_integerValueForKey:@"page"];
        }
    }
    return self;
}

@end
