//
//  GYTestAppDelegate.m
//  GYCore
//
//  Created by guyaoyao on 05/16/2019.
//  Copyright (c) 2019 guyaoyao. All rights reserved.
//

#import "GYTestAppDelegate.h"

@implementation GYTestAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    //初始化Context
    [GYContext share].application = application;
    [GYContext share].launchOptions = launchOptions;
    [GYContext share].appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

    //执行父类的方法
    [super application:application didFinishLaunchingWithOptions:launchOptions];

    return YES;
}


@end
