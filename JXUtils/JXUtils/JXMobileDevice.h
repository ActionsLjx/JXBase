//
//  JXMobileDevice.h
//  JXDemo
//
//  Created by _ljx on 2020/1/15.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JXUtilsHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface JXMobileDevice : NSObject

#pragma mark -- 获取屏幕宽度
+ (CGFloat)getDeviceScreenWidth;

#pragma mark -- 获取屏幕高度
+ (CGFloat)getDeviceScreenHeight;

#pragma mark -- 获取设备类型
+ (NSString *)getiPhoneModel;

#pragma mark -- 获取设备具体型号
+ (NSString *)getIphoneName;

#pragma mark -- 获取App版本号
+ (NSString *)getAppVersion;

#pragma mark -- 获取App名称
+ (NSString *)getAppName;

#pragma mark -- 获取系统名称
+ (NSString *)getSystemName;

#pragma mark -- 获取系统版本
+ (NSString *)getSystemVersion;

#pragma mark -- 获取设备唯一标识符UUID
+ (NSString *)getUUID;

#pragma mark -- 获取总内存大小
+ (long long)getTotalMemorySize;

#pragma mark --获取当前设备可用内存(单位：bit）
+ (double)getAvailableMemory;

#pragma mark -- 获取当前任务所占用的内存（单位：bit）
+ (double)getUsedMemory;

#pragma mark -- 电池电量
+ (long long)getBatteryLevel;

#pragma mark -- 获取精准电池电量
+(long long)getCurrentBatteryLevel;

#pragma mark -- 获取电池状态, 共四种
+(NSString *)getBatteryState;

#pragma mark -- 获取当前语言
+(NSString *)getCurrentLanguage;

#pragma mark -- 获取用户设置的设备名称
+(NSString *)getDeviceName;

#pragma mark -- 获取App Bundle ID
+ (NSString *)getAppBundleID;

#pragma mark -- 手机震动
+(void)vibrateShortWithComplete:(JXEventComplete __nullable)complete;

#pragma mark -- 调节手机亮度
+(void)setScreenBright:(CGFloat)value;

#pragma mark -- 判断是否iPhoneX系列
+ (BOOL)isiPhoneXSeries;

#pragma mark -- 获取总磁盘容量
+ (NSNumber *)getTotalDiskSpace;

#pragma mark -- 磁盘可用容量
+ (NSNumber *)getFreeDiskSpace;

#pragma mark -- 获取GPRS网络状态
+ (NSString *)getGPRSType;
@end

NS_ASSUME_NONNULL_END
