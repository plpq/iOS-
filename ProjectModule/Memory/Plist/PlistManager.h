/*
 ***************************************************************************
 * 类名	    ： PlistManager
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * 1
 ***************************************************************************
 */

#import <Foundation/Foundation.h>

@interface PlistManager : NSObject

//创建用户信息的plist文件
+ (BOOL)addPlistWithUserInfo:(NSDictionary *)userInfo;

//修改用户某个信息
+ (BOOL)setUserInfoValue:(id)value
                   forKey:(NSString *)key;

//获取用户的所有信息
+ (NSDictionary *)getAllUserInfo;

//获取用户的某个信息
+ (id)getOneUserInfoWithKey:(NSString *)key;

//删除用户信息
+ (BOOL)delUserInfo;

@end
