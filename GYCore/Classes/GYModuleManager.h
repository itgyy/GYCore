//
//  GYModuleManager.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>


/* 模块事件枚举值 */
typedef NS_ENUM(NSInteger, GYModuleEventType) {
    GYMSetupEvent = 0,
    GYMInitEvent
};

NS_ASSUME_NONNULL_BEGIN

@interface GYModuleManager : NSObject


/**
 模块管理类

 @return 单利
 */
+ (instancetype)shareManager;


/**
 注册模块

 @param moduleClass 模块类
 */
- (void)registerModuleClass:(Class)moduleClass;


/**
 处理模块相关事件的方法

 @param eventType 事件类型
 */
- (void)handleModuleEvent:(GYModuleEventType)eventType;

@end

NS_ASSUME_NONNULL_END
