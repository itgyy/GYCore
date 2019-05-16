//
//  MainTabServer.h
//  wan_oc
//
//  Created by gyy on 2019/4/29.
//  Copyright © 2019 古耀耀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTabServerProtocol.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//继承与GYServerProtocol协议，实现单利类
@interface MainTabServer : NSObject <MainTabServerProtocol>


@end

NS_ASSUME_NONNULL_END
