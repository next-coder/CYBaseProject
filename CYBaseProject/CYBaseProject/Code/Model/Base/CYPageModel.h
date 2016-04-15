//
//  EUPageModel.h
//  Euaaaios
//
//  Created by HuangQiSheng on 4/13/16.
//  Copyright © 2016 euaaa. All rights reserved.
//

#import "CYBaseModel.h"

@interface CYPageModel : CYBaseModel

@property (nonatomic, assign, readonly) NSInteger total;
@property (nonatomic, assign, readonly) NSInteger page;

@end
