//
//  CYBaseModel.m
//  MoneyJar2
//
//  Created by Charry on 15/6/17.
//  Copyright (c) 2015年 Charry. All rights reserved.
//

#import "CYBaseModel.h"

@implementation CYBaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    if (self = [super init]) {

        NSDictionary *keysForModelProperties = [self.class keysForModelProperties];
        [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, id  _Nonnull obj, BOOL * _Nonnull stop) {

            NSString *propertyKey = (keysForModelProperties[key] ? : key);
            [self setValue:obj forKey:propertyKey];
        }];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {

    if (value == [NSNull null]) {

        value = nil;
    }

    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {

    // cannot find the key
    NSLog(@"some key : %@, value: %@ is undefined", key, value);

}

- (void)setNilValueForKey:(NSString *)key {

    // just do nothing
}

+ (NSDictionary *)keysForModelProperties {

    return nil;
}

+ (instancetype)modelFromDictionary:(NSDictionary *)dic {
    
    return [[self alloc] initWithDictionary:dic];
}

+ (NSArray *)modelArrayFromDictionaryArray:(NSArray *)dicArray {
    
    if (dicArray
        && [dicArray isKindOfClass:[NSArray class]]
        && [dicArray count] != 0) {

        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:[dicArray count]];
        for (NSDictionary *dic in dicArray) {
            
            id model = [self modelFromDictionary:dic];
            if (model) {
                
                [modelArray addObject:model];
            }
        }
        return modelArray;
    }
    return nil;
}

+ (BOOL)arrayIsNullOrEmpty:(NSArray *)array {
    
    if (!array
        || ![array isKindOfClass:[NSArray class]]
        || [array count] == 0) {
        
        return YES;
    }
    return NO;
}

@end
