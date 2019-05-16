//
//  GYAppDelegate.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
#import <UserNotifications/UserNotifications.h>
#endif

@interface GYAppDelegate : UIResponder <UIApplicationDelegate
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
                                        ,
                                        UNUserNotificationCenterDelegate
#endif
                                        >
@property (nonatomic, strong) UIWindow *window;

@end
