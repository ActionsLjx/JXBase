//
//  UIColor+JXExtension.m
//  JXDemo
//
//  Created by _ljx on 2019/12/27.
//  Copyright © 2019 _ljx. All rights reserved.
//

#import "UIColor+JXExtension.h"

@implementation UIColor (Extension)

+ (UIColor *)JXColorWithRed:(unsigned int)red Green:(unsigned int)green Blue:(unsigned int)blue Alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:(float)red/255.0f green:(float)green/255.0f blue:(float)blue/255.0f alpha:alpha];
}

+ (UIColor *)JXColorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha {
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] uppercaseString];
    
    if([cString length] < 6) return [UIColor blackColor];
    if([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g ,b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0f
                           green:(float)g / 255.0f
                            blue:(float)b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)JXColorWithUIImage:(UIImage *)image {
    return [self colorWithPatternImage:image];
}

@end
