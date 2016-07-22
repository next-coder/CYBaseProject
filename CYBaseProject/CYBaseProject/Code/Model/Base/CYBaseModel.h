//
//  CYBaseModel.h
//  MoneyJar2
//
//  Created by Charry on 15/6/17.
//  Copyright (c) 2015年 Charry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+CYSecureValue.h"

@interface CYBaseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dic;

// if subclass rewrite this one, it must be call super, and add super's list to the new list
// this method default return nil, which means all the property key and data key are the same
+ (NSDictionary *)keysForModelProperties;

+ (instancetype)modelFromDictionary:(NSDictionary *)dic;
+ (NSArray *)modelArrayFromDictionaryArray:(NSArray *)dicArray;

@end
