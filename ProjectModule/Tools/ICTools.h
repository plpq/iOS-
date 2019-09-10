//
//  ICTools.h
//  ProjectModule
//
//  Created by xianwen on 2019/8/8.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICTools : NSObject

// 判断设备是否安装sim卡
+ (BOOL)isSIMInstalled;
//判断手机号格式是否正确
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//判断身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
//判断银行卡号
+ (BOOL)validateBankCardNumber:(NSString *)textString;
//验证邮箱格式
+ (BOOL)isAvailableEmail:(NSString *)email;
//判断固话格式,带—
+ (BOOL)isTelNumber:(NSString *)number;
//获取字符串宽高
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
+ (float)heightForString:(NSString *)str fontSize:(float)fontSize andHeight:(float)hgt;
//获取当前日期(NSString类型)
+ (NSString *)getCurrentDateString;
//获取当前时间戳(以秒为单位)
+(NSString *)getNowTimeTimestamp;
//打电话
+ (void)callTelphoneWithNumber:(NSString *)number;
// 检查字符串是否是纯数字
+ (BOOL)checkStringIsOnlyDigital:(NSString *)str;
//判断字符串中包含汉字
+ (BOOL)checkStringIsContainerChineseCharacter:(NSString *)string;
// 检查字符串是否是纯字母
+ (BOOL)checkStringIsOnlyLetter:(NSString *)str;
//判断字符串是否包含字母数字
+ (BOOL)checkIsHaveNumAndLetter:(NSString*)password;
//让用户去设置WIFI
+ (void)goSettingWIFI;
//** 当前网络类型（wifi、wlan、其他）
+ (NSString *)getNewWorkType;
/** 运营商类型（移动、电信、联通） */
+ (NSString *)getNetPhoneType;
//手机型号
+ (NSString *)getIphoneType;
//获取当前控制器
+(UIViewController*)currentViewController;
//更新弹窗
+(void)showUpdateAlertCtl:(NSString *)appID;
//判断是否需要更新
+(void)checkVersionNeedUpdate:(NSString *)appID;
//视图调试
+(void)showUIDebugView;

@end

NS_ASSUME_NONNULL_END
