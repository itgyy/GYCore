//
//  GYAppDelegate.m
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import "GYAppDelegate.h"
#import "GYModuleManager.h"
#import "GYServerManager.h"
#import "MainTabServerProtocol.h"

@implementation GYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [[GYModuleManager shareManager] handleModuleEvent:GYMSetupEvent]; //设置模块事件
    [[GYModuleManager shareManager] handleModuleEvent:GYMInitEvent]; //模块初始化事件

    //注册Tabbar服务
    id<MainTabServerProtocol> mainTabServer = [[GYServerManager sharedManager] createService:@protocol(MainTabServerProtocol)];
    if (mainTabServer) {
        self.window.rootViewController = mainTabServer.mainTabBarController;
    }

    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
}


- (void)applicationWillTerminate:(UIApplication *)application
{
}


@end
