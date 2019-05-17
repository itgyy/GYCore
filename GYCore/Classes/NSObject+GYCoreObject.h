//
//  NSObject+GYCoreObject.h
//  GYCore_Example
//
//  Created by gyy on 2019/5/17.
//  Copyright © 2019 guyaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GYCoreObject)


/**
 根据属性名获取属性值
 
 @param property 属性名
 @return 属性值
 */
- (id)getPropertyValue:(NSString *)property;


/**
 设置属性
 
 @param value 属性值
 @param property 属性名称
 */
- (void)setPropertyValue:(id)value forProperty:(NSString *)property;

@end

NS_ASSUME_NONNULL_END
