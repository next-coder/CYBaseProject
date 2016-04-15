//
//  CYBaseViewModel.m
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/15/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import "CYBaseViewModel.h"

@implementation CYBaseViewModel

+ (NSArray *)viewModelsFromModels:(NSArray *)productModels {
    
    if (!productModels
        || productModels.count == 0) {
        
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:productModels.count];
    [productModels enumerateObjectsUsingBlock:^(CYBaseModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CYBaseViewModel *model = [[self alloc] initWithModel:obj];
        [array addObject:model];
    }];
    return [array copy];
}

- (instancetype)initWithModel:(CYBaseModel *)model {
    
    if (self = [super init]) {
        
        _model = model;
    }
    return self;
}

@end
