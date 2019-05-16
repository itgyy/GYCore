//
//  GYServerManager.m
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import "GYServerManager.h"
#import "GYServerProtocol.h"

@interface GYServerManager ()

@property (nonatomic, strong) NSMutableDictionary *serviceClassDictionary;
@property (nonatomic, strong) NSMutableDictionary *serviceInstanceDictionary;

@end


@implementation GYServerManager

+ (instancetype)sharedManager
{
    static GYServerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      manager = [[self alloc] init];
    });

    return manager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _serviceClassDictionary = [NSMutableDictionary dictionary];
        _serviceInstanceDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}


- (void)registerService:(Protocol *)protocol impClass:(Class)serviceClass
{
    NSString *protocolString = NSStringFromProtocol(protocol);
    NSString *serviceClassString = NSStringFromClass(serviceClass);
    if (![serviceClass conformsToProtocol:protocol]) {
        NSLog(@"服务注册失败,该类(%@)未实现服务协议(%@)", serviceClassString, protocolString);
        return;
    }
    if (![protocolString isKindOfClass:[NSString class]] || ![serviceClassString isKindOfClass:[NSString class]]) {
        NSLog(@"服务注册失败,该类(%@)未空或服务协议(%@)为空", serviceClassString, protocolString);
        return;
    }
    [self.serviceClassDictionary setObject:serviceClassString forKey:protocolString];
}


- (id)createService:(Protocol *)protocol
{

    if (protocol == nil) {
        NSLog(@"服务实现对象创建失败，服务协议不能为空");
        return nil;
    }

    NSString *protocolString = NSStringFromProtocol(protocol);
    if (![protocolString isKindOfClass:[NSString class]]) {
        NSLog(@"服务实现对象创建失败，服务协议不能为空");
        return nil;
    }

    NSString *serviceClassString = self.serviceClassDictionary[protocolString];
    if (![serviceClassString isKindOfClass:[NSString class]]) {
        NSLog(@"服务实现对象创建失败，服务协议的实现对象类为空");
        return nil;
    }

    id implInstance = nil;
    Class serviceClass = NSClassFromString(serviceClassString);
    if ([[serviceClass class] respondsToSelector:@selector(sharedInstance)]) {
        implInstance = [[serviceClass class] sharedInstance];
    }
    else {
        implInstance = [[serviceClass alloc] init];
    }

    if (![implInstance respondsToSelector:@selector(isSingleton)]) {
        return implInstance;
    }

    if (![implInstance isSingleton]) {
        [self.serviceInstanceDictionary setObject:implInstance forKey:protocolString];
        return implInstance;
    }

    id instance = self.serviceInstanceDictionary[protocolString];
    if (instance) {
        return instance;
    }
    else {
        [self.serviceInstanceDictionary setObject:implInstance forKey:protocolString];
    }
    return implInstance;
}


@end
