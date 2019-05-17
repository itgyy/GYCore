//
//  NSObject+GYCoreObject.m
//  GYCore_Example
//
//  Created by gyy on 2019/5/17.
//  Copyright © 2019 guyaoyao. All rights reserved.
//

#import "NSObject+GYCoreObject.h"
#import <objc/runtime.h>


@implementation NSObject (GYCoreObject)

- (id)getPropertyValue:(NSString *)property
{
    return objc_getAssociatedObject(self, (__bridge const void *_Nonnull)(property));
}

- (void)setPropertyValue:(id)value forProperty:(NSString *)property
{
    objc_setAssociatedObject(self, (__bridge const void *_Nonnull)(property), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
