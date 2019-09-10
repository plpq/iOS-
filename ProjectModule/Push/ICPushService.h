//
//  DSPushService.h
//  ProjectModule
//
//  Created by xianwen on 2019/8/7.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,EncryptionType) {
    EncryptionTypeNone = 0,
    EncryptionTypeDo,
};

@interface ICPushService : NSObject

@property (nonatomic,strong) NSString *hostStr;
@property (nonatomic,strong) NSString *deviceTokenStr;
@property (nonatomic,strong) NSString *requestMethod;
@property (nonatomic,assign) EncryptionType type;

+ (instancetype)defaultPushService;

//授权和注册
- (BOOL)ICPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

//向服务器发送DeviceToken
- (void)sendDeviceTokenToService:(NSString *)urlStr;

//注册成功得到deviceToken
- (void)ICPushApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
//注册失败报错
- (void)ICPushApplication:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

//这个是为了在HomeScreen点击App图标进程序
- (void)ICBecomeActive:(UIApplication *)application;

//这是处理发送过来的推送
- (void)ICPushApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)ICPushApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:( void (^ _Nullable)(UIBackgroundFetchResult))completionHandler;


@end

NS_ASSUME_NONNULL_END
