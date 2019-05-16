//
//  MainTabModule.m
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import "MainTabModule.h"
#import "GYModuleManager.h"
#import "GYServerManager.h"
#import "MainTabServer.h"

@implementation MainTabModule

+ (void)load
{
    //注册模块
    NSLog(@" 注册MainTabBar模块  ");
    [[GYModuleManager shareManager] registerModuleClass:[self class]];
}

- (void)moduleSetUp:(GYContext *)context
{
    //注册服务
    [[GYServerManager sharedManager] registerService:@protocol(MainTabServerProtocol) impClass:[MainTabServer class]];
}

- (void)moduleInit:(GYContext *)context
{
    NSLog(@"注册MainTabBar模块成功");
}


@end
