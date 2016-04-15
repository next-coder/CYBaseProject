//
//  CYBaseViewModel.h
//  CYBaseProject
//
//  Created by HuangQiSheng on 4/15/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYBaseModel.h"

@interface CYBaseViewModel : NSObject

+ (NSArray *)viewModelsFromModels:(NSArray *)productModels;
- (instancetype)initWithModel:(CYBaseModel *)model;

@property (nonatomic, strong, readonly) CYBaseModel *model;

@end
