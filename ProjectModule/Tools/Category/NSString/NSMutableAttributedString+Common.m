//
//  NSMutableAttributedString+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "NSString+Expand.h"
#import "NSMutableAttributedString+Common.h"

@implementation NSMutableAttributedString (Common)

- (NSMutableAttributedString *)setColor:(UIColor *)color range:(NSRange)range{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    return self;
}
- (NSMutableAttributedString *)setFont:(UIFont *)font range:(NSRange)range{
    [self addAttribute:NSFontAttributeName value:font range:range];
    return self;
}
- (NSMutableAttributedString *)setUnderline:(NSRange)range{
    [self addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];
    return self;
}

- (NSMutableAttributedString *)setFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range {
    if (font) {
        [self setFont:font range:range];
    }
    if (color) {
        [self setColor:color range:range];
    }
    return self;
}

- (NSMutableAttributedString *)setFont:(UIFont *)font color:(UIColor *)color text:(NSString *)text index:(NSInteger)index {
    
    if (index < 0) {
        NSArray *rangs = [self.string rangsWithSubString:text];
        for (NSString *rangStr in rangs) {
            [self setFont:font color:color range:NSRangeFromString(rangStr)];
        }
    } else if (index == 0) {
        NSRange range = [self.string rangeOfString:text];
        if (range.location != NSNotFound) {
            [self setFont:font color:color range:range];
        }
    } else {
        NSArray *rangs = [self.string rangsWithSubString:text];
        if (rangs.count > index) {
            [self setFont:font color:color range:NSRangeFromString(rangs[index])];
        }
    }
    return self;
}



@end
