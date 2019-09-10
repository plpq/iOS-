
/* Base Model
 ***************************************************************************
 * 类名	  ： NSString+Expand
 * 建立日期	： 2014-02-13
 * 版权声明	： 本代码版权归东软集团（大连）有限公司所有，禁止任何未授权的传播和使用
 * 作者		： yan.jm@neusoft.com
 * 模块		：
 * 描述		： 字符串处理扩展类
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * 1
 * 2
 ***************************************************************************
 */

#import "NSString+Expand.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Expand)
/*
 方法说明:
 添加正则验证
 
 参数说明:
 validateStr：正则字符
 返回结果:
 
 */
-(BOOL )isMatchedWithRegex:(NSString *)regexStr{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
/*
 方法说明:
 计算带汉字的字符串长度
 
 参数说明:
 text：需要计算的内容
 返回结果:
 int：带汉字的计算结果
 */
- (NSUInteger)textLength
{
    NSUInteger returnLength = self.length;
    NSUInteger length=self.length;
    while (length>0) {
        unichar c=[self characterAtIndex:--length];
        NSString *str=[NSString stringWithFormat:@"%C",c];
        if ([str isMatchedWithRegex:@"[^x00-xff]"]) {
            returnLength=returnLength+1;
        }
    }
    return returnLength;
}
/*
 方法说明:
 去除所有空格，包括开头和字符串中间
 
 参数说明:
 无
 
 返回结果:
 NSString
 */
-(NSString *)trimAll
{
    NSString *result=[self stringByReplacingOccurrencesOfString:@" " withString:@""];
    result=[result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return result;
    
}
/*
 方法说明:
 截取字符串中从I到J的字符串
 
 参数说明:
 star:表示开始截取位置（从0开始）
 length:表示截取长度
 
 返回结果:
 NSString
 */

-(NSString *)subString :(int)star length:(int)length
{
    if (self.length<star+length) {
        return nil;
    }
    NSRange range;
    range.location=star;
    range.length=length;
    return [self substringWithRange:range];
}
/*
 方法说明:
 字符串中是否包含str2
 
 参数说明:
 str2:被包含的字符串
 
 返回结果:
 BOOL
 */
-(BOOL)isContainStr:(NSString *)str2
{
    NSRange range=[self rangeOfString:str2];
    if (range.length!=0) {
        return YES;
    }else {
        return NO;
    }
}
/*
 方法说明:
 字符串翻转，将字符串倒置
 参数说明:
 无
 
 返回结果:
 NSString
 */

-(NSString *)reverse
{
    NSUInteger len=[self length];
    NSMutableString *retStr=[NSMutableString stringWithCapacity:len];
    while (len>0) {
        unichar c=[self characterAtIndex:--len];
        NSString *str=[NSString stringWithFormat:@"%C",c];
        [retStr appendString:str];
    }
    return retStr;
}

/*
 方法说明:
 删除字符串中指定的字符
 参数说明:
 str：被删除的字符串
 
 返回结果:
 NSString
 */
-(NSString *)removeStr:(NSString *)str
{
    NSString *newStr=[self stringByReplacingOccurrencesOfString:str withString:@""];
    return newStr;
}
/*
 方法说明:
 将字符串中指定位置的字符删除
 参数说明:
 star：表示开始删除位置（从0开始）
 length：表示删除长度
 
 返回结果:
 NSString
 */
-(NSString *)removeAtIndexStr:(int)star length:(int)length
{
    if (self.length<star+length) {
        return nil;
    }
    NSRange range;
    range.location=star;
    range.length=length;
    NSString *result= [self stringByReplacingCharactersInRange:range withString:@""];
    return result;
}

/*
 方法说明:
 字符串中指定字符str的出现的次数
 参数说明:
 str：指定的字符串
 
 返回结果:
 int:指定字符串出现的次数
 */
-(NSUInteger)countStr:(NSString *)str
{
    //以str为线分割字符串放入到数组中
    NSArray *arr = [self componentsSeparatedByString:str];
    NSUInteger count = 0;
    if(arr && arr.count > 0)
        count = arr.count - 1;
    return count;
}

/*
 方法说明:
 替换字符串中指定的字符
 参数说明:
 star：表示开始替换位置（从0开始）
 length：表示替换长度
 str:要替换成的字符串的str
 返回结果:
 NSString
 */

-(NSString *)replaceStr:(int)star length:(int)length str:(NSString *)str
{
    if (self.length<star+length) {
        return nil;
    }
    NSRange range;
    range.location=star;
    range.length=length;
    NSString *result= [self stringByReplacingCharactersInRange:range withString:str];
    return result;
}


/*
 方法说明:
 判断字符串是否为空
 参数说明:
 
 返回结果:
 BOOL
 */
-(BOOL)isNotEmpty
{
    NSString *result=self;
    BOOL flag=NO;
    if (![result isEqualToString:@""]) {
        flag=YES;
    }
    return flag;
}

/*
 方法说明:
 将NSNULL对象转成“-”，
 返回NSString对象
 参数说明:
 
 返回结果:
 处理后的结果
 */
+ (NSString *)stringExceptNull:(id)obj{
    
    if ([obj isKindOfClass:[NSNull class]]) {
        return @"-";
    }
    return [NSString stringWithFormat:@"%@",obj];
}

//判断是不是数字
- (BOOL)CheckFloatValueInput:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)CheckIntValueInput:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (NSArray *)rangsWithSubString:(NSString *)subString {
    int location = 0;
    NSMutableArray *locationArr = [NSMutableArray new];
    NSRange range = [self rangeOfString:subString];
    //声明一个临时字符串,记录截取之后的字符串
    NSString * subStr = self;
    while (range.location != NSNotFound) {
        [locationArr addObject:NSStringFromRange(NSMakeRange(range.location+location, range.length))];
        subStr = [subStr substringFromIndex:range.location+range.length];
        location += range.location + subString.length;
        range = [subStr rangeOfString:subString];
    }
    return [locationArr copy];
}

@end
