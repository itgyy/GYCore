//
//  GYServerProtocol.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GYServerProtocol <NSObject>

/**
 * @brief 该服务实现对象，是否是单例。如果是，则需同时实现sharedInstance方法。
 * @return 是单例返回YES，否则返回NO。
 */
- (BOOL)isSingleton;

/**
 * @brief 服务实现对象的单例方法
 * @return 返回该服务实现对象的单例。
 */
+ (id)sharedInstance;


@end

NS_ASSUME_NONNULL_END
