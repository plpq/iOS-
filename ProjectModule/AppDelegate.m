//
//  AppDelegate.m
//  ProjectModule
//
//  Created by xianwen on 2019/8/7.
//  Copyright © 2019 xianwen. All rights reserved.
//

//#import "LLDebug.h"
#import "AppDelegate.h"
//#import "AvoidCrash.h"
//#import "ICPushService.h"
#import "ViewController.h"
//#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

 //   [self setCrashHandle];
    
//    ICPushService *service = [ICPushService defaultPushService];
//   // service.type = EncryptionTypeNone;
//    service.hostStr = @"xxxxxx";
//    [service ICPushApplication:application didFinishLaunchingWithOptions:launchOptions];
    
    UINavigationController *navCtl = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    self.window.rootViewController = navCtl;

    
    #ifdef DEBUG
 //   [[LLDebugTool sharedTool] startWorking];
    
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//    [self.window addGestureRecognizer:longPress];
    
    #endif
    
    //调用系统接口判断版本,替换appID
//    [ICTools checkVersionNeedUpdate:@"8768989879"];
    //调用自己服务端接口判断版本,在接口返回结果里调用,同样传入appID
   // [ICTools showUpdateAlertCtl:appID];
    
    return YES;
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    [ICTools showUIDebugView];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  //  [self checkVersion];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
//
//    if ([ICPushService defaultPushService].type == EncryptionTypeNone) {
//        
//          [[ICPushService defaultPushService] ICPushApplication:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
//    }
//    else{
//        
//        //可做加密加签处理
//        NSString *urlStr = [NSString stringWithFormat:@"%@?deviceToken=%@",[ICPushService defaultPushService].hostStr,[ICPushService defaultPushService].deviceTokenStr];
//        [[ICPushService defaultPushService] sendDeviceTokenToService:urlStr];
//    }
//    
//}
//
//- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
//    
//    [[ICPushService defaultPushService] ICPushApplication:application didFailToRegisterForRemoteNotificationsWithError:error];
//}

#pragma mark- AvoidCrash

- (void)setCrashHandle{
    
//    [AvoidCrash makeAllEffective];
//    NSArray *noneSelClassStrings = @[
//                                     @"NSNull",
//                                     @"NSNumber",
//                                     @"NSString",
//                                     @"NSDictionary",
//                                     @"NSArray"
//                                     ];
//
//    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}

//- (void)dealwithCrashMessage:(NSNotification *)note {
//    
//    // NSLog(@"bug:%@",note.userInfo);
//    NSDictionary *info = note.userInfo;
//    NSString *errorReason = [NSString stringWithFormat:@"【ErrorReason】%@========【ErrorPlace】%@========【DefaultToDo】%@========【ErrorName】%@", info[@"errorReason"], info[@"errorPlace"], info[@"defaultToDo"], info[@"errorName"]];
//    NSLog(@"%@",errorReason);
//}



@end
