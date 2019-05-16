#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GYAppDelegate.h"
#import "GYContext.h"
#import "GYCore.h"
#import "GYModuleManager.h"
#import "GYModuleProtocol.h"
#import "GYServerManager.h"
#import "GYServerProtocol.h"
#import "MainTabModule.h"
#import "MainTabServer.h"
#import "MainTabServerProtocol.h"

FOUNDATION_EXPORT double GYCoreVersionNumber;
FOUNDATION_EXPORT const unsigned char GYCoreVersionString[];

