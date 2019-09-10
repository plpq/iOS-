//
//  YanUserInfo.h
//  Car
//
//  Created by JG Yan on 2018/1/11.
//  Copyright © 2018年 JG Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICUserInfo : NSObject

+ (void)saveUserInfo:(NSString *)value forKey:(id)key;
+ (id)getUserInfo:(NSString *)key;
+ (void)removeUserInfo:(NSString *)key;
+ (void)removeUserAllInfo;

@end
