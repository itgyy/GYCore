//
//  MainTabServerProtocol.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GYServerProtocol.h"
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol MainTabServerProtocol <GYServerProtocol>

/**
 主窗口
 */
@property (strong, nonatomic) UIViewController *mainTabBarController;


@end

NS_ASSUME_NONNULL_END
