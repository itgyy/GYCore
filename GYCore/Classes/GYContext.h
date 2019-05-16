//
//  GYContext.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 组件环境类
 */
@interface GYContext : NSObject

+ (instancetype)share;


/**
 程序APP Bundle ID
 */
@property (copy, nonatomic) NSString *appBundleID;

/**
 程序版本
 */
@property (copy, nonatomic) NSString *appVersion;

/**
 当前App的Device token
 */
@property (nonatomic, strong) NSData *deviceToken;

/**
 当前App对象
 */
@property (nonatomic, strong) UIApplication *application;

/**
 App在didFinishLaunchingWithOptions:方法中所传入的launchOptions对象。
 */
@property (nonatomic, strong) NSDictionary *launchOptions;

/**
 App在didReceiveRemoteNotification:方法中所传入的userInfo对象。
 */
@property (nonatomic, strong) NSDictionary *userInfo;


/**
 当前显示的controller
 */
- (UIViewController *)getCurrentVC;


@end

NS_ASSUME_NONNULL_END
