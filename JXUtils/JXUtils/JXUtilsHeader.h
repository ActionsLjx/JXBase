//
//  JXUtilsHeader.h
//  JXDemo
//
//  Created by _ljx on 2019/12/27.
//  Copyright © 2019 _ljx. All rights reserved.
//

#ifndef JXUtilsHeader_h
#define JXUtilsHeader_h

//字体 平方
#define PFL_FONT(a) [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? [UIFont fontWithName:@"PingFangSC-Light" size:a] :[UIFont fontWithName:@"Heiti SC" size:a]
#define PFR_FONT(a) [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? [UIFont fontWithName:@"PingFangSC-Regular" size:a] :[UIFont fontWithName:@"Heiti SC" size:a]
#define PFM_FONT(a) [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? [UIFont fontWithName:@"PingFangSC-Medium" size:a] :[UIFont fontWithName:@"Heiti SC" size:a]

#define IS_IPAD [[UIDevice currentDevice].model rangeOfString:@"iPad"].length > 0
#define IS_IPHONE [[UIDevice currentDevice].model rangeOfString:@"iPhone"].length > 0
#define iPhoneXSeries [JXMobileDevice isiPhoneXSeries]
#define kStateBarHeight (iPhoneXSeries ? 44.0f : 20.0f)
#define kNaviHeight (iPhoneXSeries ? 88.0f : 64.0f)
#define kTabBarHeight (iPhoneXSeries ? 83.0f : 49.5f)
#define KTabBarSafeHeight 33.5f
#define kNaviBarAndStatusBarHeight (KStateBarHeight + KNaviHeight)
#define kTabBarAndBarSafeHeight (KTabBarHeight + KTabBarSafeHeight)

#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height


//字体间距 9以下有些字体间没有行间距
#define Text_Spacing  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? 0.0 : 6.0)


//color
#define HEX_COLOR(c,a) [UIColor colorWithHex:c alpha:a]


//block是否可用、返回
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };
#define BLOCK_EXEC_MAIN(block, ...) dispatch_async(dispatch_get_main_queue(), ^{ if (block) { block(__VA_ARGS__); }; });


//log
#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif


//block
typedef void (^JXObjComplete)(id value);

typedef void (^JXValueComplete)(NSInteger value);

typedef void (^JXFloatComplete)(CGFloat value);

typedef void (^JXEventComplete)(void);

typedef void (^JXBoolComplete)(BOOL value);

#endif /* JXUtilsHeader_h */
