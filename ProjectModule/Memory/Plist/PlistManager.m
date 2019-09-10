/*
 ***************************************************************************
 * 类名	    ： PlistManager
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * 1
 ***************************************************************************
 */

#import "PlistManager.h"

@implementation PlistManager


//创建用户信息的plist文件
+ (BOOL)addPlistWithUserInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc]initWithDictionary:userInfo];
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"userInfo.plist"];
    return [data writeToFile:filename atomically:YES];
}

//修改用户某个信息
+ (BOOL)setUserInfoValue:(id)value forKey:(NSString *)key
{
    NSString *plistPath = [self connectPlist];
    NSMutableDictionary *userInfoDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    [userInfoDic setObject:value forKey:key];
    return [userInfoDic writeToFile:plistPath atomically:YES];
}

//获取用户的所有信息
+ (NSDictionary *)getAllUserInfo
{
    NSString *plistPath = [self connectPlist];
    NSMutableDictionary *userInfoDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    return userInfoDic;
}

//获取用户的某个信息
+ (id)getOneUserInfoWithKey:(NSString *)key
{
    NSString *plistPath = [self connectPlist];
    NSMutableDictionary *userInfoDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    return [userInfoDic valueForKey:key];
}

//删除用户信息
+ (BOOL)delUserInfo
{
    NSString *plistPath = [self connectPlist];
    NSMutableDictionary *userInfoDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    if (userInfoDic)
    {
        [userInfoDic removeAllObjects];
        return [userInfoDic writeToFile:plistPath atomically:YES];
    }
    return true;
}

//获取沙盒路径，如果已经创建则不需要创建，否则创建
+ (NSString *)connectPlist
{
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"userInfo.plist"];
    return filename;
}

@end
