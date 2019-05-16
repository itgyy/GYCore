//
//  GYServerManager.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYServerManager : NSObject

/**
 * @brief 单例方法
 * @return 单例对象
 */
+ (instancetype)sharedManager;

/**
 * @brief 注册服务的方法。
 * @param protocol 要注册的服务协议
 * @param serviceClass 实现该服务的类
 */
- (void)registerService:(Protocol *)protocol impClass:(Class)serviceClass;

/**
 * @brief 创建实现某一服务协议的对象的方法。
 * @param protocol 要创建的服务协议
 * @return 实现该服务协议的对象。
 */
- (id)createService:(Protocol *)protocol;


@end

NS_ASSUME_NONNULL_END
