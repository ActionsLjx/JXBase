//
//  UIColor+Extension.h
//  JXDemo
//
//  Created by _ljx on 2019/12/27.
//  Copyright © 2019 _ljx. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

+ (UIColor *)JXColorWithRed:(unsigned int)red Green:(unsigned int)green Blue:(unsigned int)blue Alpha:(CGFloat)alpha;
/**
16进制颜色转换为UIColor

@param hexColor 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
@param alpha 透明度
@return 16进制字符串对应的颜色
*/
+ (UIColor *)JXColorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

/**
从一张纯色图片获取颜色对象
@param image 获取颜色的对象图片
@return 图片对应颜色
*/
+ (UIColor *)JXColorWithUIImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
