//
//  YanUserInfo.m
//  Car
//
//  Created by JG Yan on 2018/1/11.
//  Copyright © 2018年 JG Yan. All rights reserved.
//

#import "ICUserInfo.h"

@implementation ICUserInfo


+(void)saveUserInfo:(NSString *)value forKey:(id)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:value forKey:key];
    [userDefault synchronize];
}

+ (id)getUserInfo:(NSString *)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:key];
}

+ (void)removeUserInfo:(NSString *)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:key];
    [userDefault synchronize];
}

+(void)removeUserAllInfo{
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSDictionary *dic = [userDefault dictionaryRepresentation];
//    for (id  key in dic) {
//        [userDefault removeObjectForKey:key];
//    }
//    [userDefault synchronize];
}

@end
