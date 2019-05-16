//
//  MainTabServer.m
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import "MainTabServer.h"

@interface MainTabServer ()

@property (strong, nonatomic) UIViewController *rootViewController;

@end


@implementation MainTabServer

#pragma mark - GYServiceProtocol
//自定实现这个方法
+ (id)sharedInstance
{
    static dispatch_once_t predicate;
    static MainTabServer *serviceInstance = nil;
    dispatch_once(&predicate, ^{
      serviceInstance = [[self alloc] init];
    });
    return serviceInstance;
}

- (BOOL)isSingleton
{
    return YES;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - MainTabServerProtocol
- (UIViewController *)mainTabBarController
{
    if (_rootViewController == nil) {
        _rootViewController = [[UIViewController alloc] init];
    }
    return _rootViewController;
}


@end
