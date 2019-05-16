//
//  GYModuleManager.m
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import "GYModuleManager.h"
#import "GYModuleProtocol.h"
#import "GYContext.h"

//方法名字
NSString *const kGYModuleSetUpSelector = @"moduleSetUp:";
NSString *const kGYModuleInitSelector = @"moduleInit:";


@interface GYModuleManager ()

@property (nonatomic, strong) NSMutableArray *modules;
@property (nonatomic, strong) NSDictionary *moduleEventSelectorInfoDictionary;

@end

@implementation GYModuleManager


+ (instancetype)shareManager
{
    static GYModuleManager *manager = nil;
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
        self.modules = [[NSMutableArray alloc] initWithCapacity:0];
        //模块方法
        self.moduleEventSelectorInfoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                   kGYModuleSetUpSelector, @(GYMSetupEvent),
                                                                   kGYModuleInitSelector, @(GYMInitEvent),
                                                                   nil];
    }
    return self;
}


- (void)registerModuleClass:(Class)moduleClass
{
    if (moduleClass == nil) {
        NSLog(@"模块注册失败，该l模块类为nil");
        return;
    }

    //遵循这个协议
    if (![moduleClass conformsToProtocol:@protocol(GYModuleProtocol)]) {
        NSLog(@"模块注册失败，该模块类未实现GYModuleProtocol协议");
        return;
    }

    //判断是否有这个类
    NSString *moduleClassName = NSStringFromClass(moduleClass);
    if (![moduleClassName isKindOfClass:[NSString class]] || moduleClassName.length == 0) {
        NSLog(@"模块注册失败，该模块为空");
        return;
    }

    //是否已注册
    if ([self.modules containsObject:moduleClassName]) {
        NSLog(@"该模块%@类已注册过", moduleClassName);
        return;
    }

    //根据类名生产类
    Class modlueClass = NSClassFromString(moduleClassName);
    //创建对象
    id<GYModuleProtocol> moduleInstance = [[modlueClass alloc] init];

    [self.modules addObject:moduleInstance];
}

- (void)handleModuleEvent:(GYModuleEventType)eventType
{

    NSString *selectorName = _moduleEventSelectorInfoDictionary[@(eventType)];
    if (![selectorName isKindOfClass:[NSString class]]) {
        return;
    }

    SEL selector = NSSelectorFromString(selectorName);
    if (!selector) {
        return;
    }

    [self.modules enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if ([obj respondsToSelector:selector]) {
          [obj performSelector:selector withObject:[GYContext share]];
      }
    }];
}


@end
