//
//  ICCommon.h
//  ProjectModule
//
//  Created by xianwen on 2019/8/8.
//  Copyright © 2019 xianwen. All rights reserved.
//

//判断是否是x系列
#define IS_IPHONE_X ({BOOL isPhoneX = NO;if (@available(iOS 11.0, *)) {isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;}(isPhoneX);})

//屏幕尺寸相关
#define ICScreenH [[UIScreen mainScreen] bounds].size.height // 屏幕高度
#define ICScreenW [[UIScreen mainScreen] bounds].size.width // 屏幕宽度

#define ICNavigationBarH 44 //顶部UINavigationBar高度
#define ICStatusBarH [[UIApplication sharedApplication] statusBarFrame].size.height//顶部状态栏高度
#define ICTabBarH (IS_IPHONE_X ? 83 : 49)//底部工具栏高度
#define ICNavgationH (IS_IPHONE_X ? 88 : 64)//顶部导航栏高度

//颜色相关

#define ICMainColor ICColor(254,48,131)/ /主色调
#define ICColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define ICColorAlpha(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define ICRandomColor  [UIColor colorWithRed:(arc4random()%256)/255.0 green:(arc4random()%256)/255.0 blue:(arc4random()%256)/255.0 alpha:1]

//16进制颜色
#define ICRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ICRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

//字体相关
#define MainFont [UIFont systemFontOfSize:15.0]
#define FONT(a) [UIFont systemFontOfSize:a]

//app版本号
#define APP_VERSION  (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//app Build版本号
#define APP_BUILD     (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//系统版本号
#define OS_VERSION  [UIDevice currentDevice].systemVersion.doubleValue
//bundle ID
#define APP_BundleID [[NSBundle mainBundle] bundleIdentifier]
//UUID
#define APP_UUID [[UIDevice currentDevice].identifierForVendor UUIDString]
//当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判空
#define Str_IsEmpty(str)    (((str) == nil) || ([(str) isEqual:[NSNull null]]) || ([@"" isEqualToString:(str)]))
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
#define kGetStringWidth(str,font,maxWidth,height) ([str boundingRectWithSize:CGSizeMake(maxWidth,height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width)

//弱引用
#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;

#ifdef DEBUG
#define ICLog(...) NSLog(@"\n%s  第%d行  %@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ICLog(...)
#endif


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICCommon : NSObject


@end

NS_ASSUME_NONNULL_END
