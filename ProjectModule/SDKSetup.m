//
//  SDKSetup.m
//  XXShield_Tests
//
//  Created by nero on 2017/11/1.
//  Copyright © 2017年 ValiantCat. All rights reserved.
//

#import <XXShield/XXShieldSDK.h>
#import "BaseViewController.h"

@interface SDKSetup : NSObject <XXRecordProtocol>

@end

@implementation SDKSetup

+ (void)load {
    
    [XXShieldSDK registerRecordHandler:[self new]];
    [XXShieldSDK registerStabilityWithAbility:(EXXShieldTypeDangLingPointer) withClassNames:@[NSStringFromClass([BaseViewController class])]];
    [XXShieldSDK registerStabilitySDK];
}

- (void)recordWithReason:(NSError *)reason {
    
    NSLog(@"XXShield has catch a non-fatal error: error is %@", reason);
}

@end
