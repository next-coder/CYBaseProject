//
//  NSObject+Runtime.m
//  CYBaseProject
//
//  Created by xn011644 on 7/22/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

#import <objc/runtime.h>

#import "NSObject+Runtime.h"

@implementation NSObject (Runtime)

//- (void)setValue:(id)value forProperty:(NSString *)propertyName {
//
//    if (!propertyName) {
//
//        return;
//    }
////    objc_property_t property = class_getProperty(self.class, [propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
//    unsigned int propertyCount = 0;
//    objc_property_t* propertyList = class_copyPropertyList(self.class, &propertyCount);
//
//    for (unsigned int i = 0; i < propertyCount; i++) {
//
//        objc_property_t property = propertyList[i];
//        class_
//    }
//
//
////    Ivar variable = class_getInstanceVariable(self.class, [propertyName cStringUsingEncoding:NSUTF8StringEncoding]);
////    if (!variable) {
////
////        variable = class_getInstanceVariable(self.class, [[@"_" stringByAppendingString:propertyName] cStringUsingEncoding:NSUTF8StringEncoding]);
////    }
////    if (!variable) {
////
////        return;
////    }
////    object_setIvar(self, variable, value);
//}

@end
