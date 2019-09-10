//
//  DSPushService.m
//  ProjectModule
//
//  Created by xianwen on 2019/8/7.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import "ICPushService.h"
#import <CommonCrypto/CommonDigest.h>
#import <AVFoundation/AVFoundation.h>
#import <UserNotifications/UserNotifications.h>

@interface ICPushService()<UNUserNotificationCenterDelegate>

@end

@implementation ICPushService

#pragma mark - lifeCycle
- (instancetype)init{
    if (self = [super init]) {
        //code here...
    }
    return self;
}
+ (instancetype)defaultPushService{
    static ICPushService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc]init];
    });
    return instance;
}

- (NSString *)requestMethod{
    
    if (!_requestMethod) {
        _requestMethod = @"GET";
    }
    return _requestMethod;
}

#pragma mark - 注册和授权
- (BOOL)ICPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0f) {
        //iOS10-
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center setDelegate:self];
        UNAuthorizationOptions options = UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert;
        [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
            //判断
            if (granted) {
                NSLog(@"注册成功");
            }else{
                NSLog(@"注册失败");
            }
        }];
    }else if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f){
        //iOS8-iOS10
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge categories:nil]];
    }
    //else{
//        //iOS8以下
//        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
//    }
    // 注册远程推送通知 (获取DeviceToken)
    [application registerForRemoteNotifications];
    
    //这个是应用未启动但是通过点击通知的横幅来启动应用的时候
    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userInfo != nil) {
        //如果有值，说明是通过远程推送来启动的
        //code here...
    }
    
    return YES;
}

//处理从后台到前台后的角标处理
-(void)ICBecomeActive:(UIApplication *)application{
    if (application.applicationIconBadgeNumber > 0) {
        application.applicationIconBadgeNumber = 0;
    }
}

#pragma mark - 远程推送的注册结果的相关方法
//成功
- (void)ICPushApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //获取设备相关信息
//    UIDevice *dev = [UIDevice currentDevice];
//    NSString *deviceName = dev.name;
//    NSString *deviceModel = dev.model;
//    NSString *deviceSystemVersion = dev.systemVersion;
//    UIDevice *myDevice = [UIDevice currentDevice];
//    NSString *deviceUDID = [myDevice identifierForVendor].UUIDString;
//    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
   // NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    //获取用户的通知设置状态
    __block  NSString *pushBadge= @"disabled";
    __block NSString *pushAlert = @"disabled";
    __block NSString *pushSound = @"disabled";
    
    if ([[UIDevice currentDevice].systemVersion floatValue]>=10.0f) {
        
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            
            if (0 == settings.authorizationStatus || settings.authorizationStatus == 1) {
                NSLog(@"推送关闭");
            }else{
                NSLog(@"推送打开");
                
                pushBadge = (settings.badgeSetting == UNNotificationSettingEnabled)? @"enabled" : @"disabled";
                pushAlert = (settings.alertSetting == UNNotificationSettingEnabled)? @"enabled" : @"disabled";
                pushSound = (settings.soundSetting == UNNotificationSettingEnabled) ? @"enabled" : @"disabled";
            }
        }];
        
    }else if ([[UIDevice currentDevice].systemVersion floatValue]>= 9.0f){
        
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            NSLog(@"推送关闭");
        }else{
            NSLog(@"推送打开");
            pushBadge = (setting.types & UIRemoteNotificationTypeBadge) ? @"enabled" : @"disabled";
            pushAlert = (setting.types & UIRemoteNotificationTypeAlert) ? @"enabled" : @"disabled";
            pushSound = (setting.types & UIRemoteNotificationTypeSound) ? @"enabled" : @"disabled";
        }
        
    }
    
    NSString *deviceTokenString = [[[[deviceToken description]
                                     stringByReplacingOccurrencesOfString:@"<"withString:@""]
                                    stringByReplacingOccurrencesOfString:@">" withString:@""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    self.deviceTokenStr = deviceTokenString;
    
//以下是发送DeviceToken给后台了，有人会问，为什么要传这么多参数，这个具体根据你们后台来哈，不要问我，问你们后台要传什么就传什么，但是DeviceToken是一定要传的
    
    if (self.type == EncryptionTypeNone) {
        
        NSString *urlString = [NSString stringWithFormat:@"%@?device_token=%@", self.hostStr,self.deviceTokenStr];
        [self sendDeviceTokenToService:urlString];
    }
}

//失败
- (void)ICPushApplication:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"注册推送失败，error = %@", error);
    //failed fix code here...
}

- (void)sendDeviceTokenToService:(NSString *)urlStr{
    
    NSURL *url;
    if (!url) {
        NSLog(@"传入的URL为空或者有非法字符,请检查参数");
        return;
    }
    NSLog(@"%@",url);
    
    //发送异步请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:5.0];
    [request setHTTPMethod:self.requestMethod];

    if ([self.requestMethod isEqualToString:@"GET"]) {
        
        url = [NSURL URLWithString:urlStr];
    }
    else{
        url = [NSURL URLWithString:self.hostStr];
        request.HTTPBody = [urlStr dataUsingEncoding:NSUTF8StringEncoding];
    }
        
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200 && data) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                if (dict && [dict[@"ret"] integerValue] == 0) {
                    NSLog(@"上传deviceToken成功！deviceToken dict = %@",dict);
                }else{
                    NSLog(@"返回ret = %zd, msg = %@",[dict[@"ret"] integerValue],dict[@"msg"]);
                }
            }else if (error) {
                NSLog(@"请求失败，error = %@",error);
            }
        });
    }];
    [task resume];
}

#pragma mark - 收到远程推送通知的相关方法
//iOS6及以下(前台是直接走这个方法不会出现提示的，后台是需要点击相应的通知才会走这个方法的)
- (void)ICPushApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    [self ICPushApplication:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:NULL];
}

//iOS7及以上
- (void)ICPushApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^_Nullable)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"%@", userInfo);
    
    
    //注意HomeScreen上一经弹出推送系统就会给App的applicationIconBadgeNumber设为对应值
    if (application.applicationIconBadgeNumber > 0) {
        application.applicationIconBadgeNumber = 0;
    }
    
    NSLog(@"remote notification: %@",[userInfo description]);
    NSDictionary *apsInfo = [userInfo objectForKey:@"aps"];
    
    NSString *alert = [apsInfo objectForKey:@"alert"];
    NSLog(@"Received Push Alert: %@", alert);
    NSString *sound = [apsInfo objectForKey:@"sound"];
    NSLog(@"Received Push Sound: %@", sound);
    NSString *badge = [apsInfo objectForKey:@"badge"];
    NSLog(@"Received Push Badge: %@", badge);
    
    //这是播放音效
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    //处理customInfo
    if ([userInfo objectForKey:@"custom"] != nil) {
        //custom handle code here...
    }
    completionHandler(UIBackgroundFetchResultNoData);
}

@end
