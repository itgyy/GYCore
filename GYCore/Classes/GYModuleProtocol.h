//
//  GYModuleProtocol.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@class GYContext;
@protocol GYModuleProtocol <NSObject>


@optional
/**
 模块SetUp方法

 @param context 包含环境信息对象
 */
- (void)moduleSetUp:(GYContext *)context;


/**
 模块初始化方法
 
 @param context 包含环境信息对象
 */
- (void)moduleInit:(GYContext *)context;


@end

NS_ASSUME_NONNULL_END
