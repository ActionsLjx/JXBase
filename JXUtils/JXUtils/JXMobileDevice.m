//
//  JXMobileDevice.m
//  JXDemo
//
//  Created by _ljx on 2020/1/15.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXMobileDevice.h"
#import <sys/utsname.h> // 获取设备信息相关
#import <mach/mach.h> //内存相关
#import <sys/sysctl.h> //内存相关
#import <AudioToolbox/AudioToolbox.h>
struct utsname systemInfo;
@implementation JXMobileDevice

#pragma mark -- 获取屏幕宽度
+ (CGFloat)getDeviceScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

#pragma mark -- 获取屏幕高度
+ (CGFloat)getDeviceScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

#pragma mark -- 获取设备类型
/**
* 获取设备大致类型
* @return iPhone iPad iPod
*/
+ (NSString *)getiPhoneModel {
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString:systemInfo.machine encoding:(NSASCIIStringEncoding)];
    if([phoneType containsString:@"iPhone"]){
        return @"iPhone";
    }
    else if([phoneType containsString:@"iPad"]){
        return @"iPad";
    }
    else if([phoneType containsString:@"iPod"]){
        return @"iPod";
    }else if([phoneType containsString:@"AppleTV"]){
        return @"AppleTV";
    }else if([phoneType containsString:@"Watch"]){
        return @"iWatch";
    }else{
        return @"Unknow";
    }
}

#pragma mark -- 获取设备具体型号
/**
* 获取设备具体型号
* @return iPhoneXS iPhone11 等
*/
+ (NSString *)getIphoneName {
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString:systemInfo.machine encoding:(NSASCIIStringEncoding)];
    if ([phoneType isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([phoneType isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([phoneType isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([phoneType isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([phoneType isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([phoneType isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([phoneType isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([phoneType isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([phoneType isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([phoneType isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([phoneType isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([phoneType isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([phoneType isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([phoneType isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([phoneType isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([phoneType isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([phoneType isEqualToString:@"iPhone10,1"])   return @"国行(A1863)、日行(A1906)iPhone 8";
    if ([phoneType isEqualToString:@"iPhone10,4"])   return @"美版(Global/A1905)iPhone 8";
    if ([phoneType isEqualToString:@"iPhone10,2"])   return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
    if ([phoneType isEqualToString:@"iPhone10,5"])   return @"美版(Global/A1897)iPhone 8 Plus";
    if ([phoneType isEqualToString:@"iPhone10,3"])   return @"国行(A1865)、日行(A1902)iPhone X";
    if ([phoneType isEqualToString:@"iPhone10,6"])   return @"美版(Global/A1901)iPhone X";
    if ([phoneType isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([phoneType isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([phoneType isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([phoneType isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([phoneType isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([phoneType isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([phoneType isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
     
    if ([phoneType isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([phoneType isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([phoneType isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([phoneType isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([phoneType isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
     
    if ([phoneType isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([phoneType isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([phoneType isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([phoneType isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([phoneType isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([phoneType isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([phoneType isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([phoneType isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([phoneType isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([phoneType isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([phoneType isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([phoneType isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([phoneType isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([phoneType isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([phoneType isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([phoneType isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([phoneType isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([phoneType isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([phoneType isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([phoneType isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([phoneType isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([phoneType isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([phoneType isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([phoneType isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([phoneType isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([phoneType isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([phoneType isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
    if ([phoneType isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([phoneType isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([phoneType isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([phoneType isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5 inch (WiFi)";
    if ([phoneType isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5 inch (Cellular)";
    if ([phoneType isEqualToString:@"iPad7,5"])      return @"iPad 6th generation";
    if ([phoneType isEqualToString:@"iPad7,6"])      return @"iPad 6th generation";
    if ([phoneType isEqualToString:@"iPad8,1"])      return @"iPad Pro (11-inch)";
    if ([phoneType isEqualToString:@"iPad8,2"])      return @"iPad Pro (11-inch)";
    if ([phoneType isEqualToString:@"iPad8,3"])      return @"iPad Pro (11-inch)";
    if ([phoneType isEqualToString:@"iPad8,4"])      return @"iPad Pro (11-inch)";
    if ([phoneType isEqualToString:@"iPad8,5"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([phoneType isEqualToString:@"iPad8,6"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([phoneType isEqualToString:@"iPad8,7"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([phoneType isEqualToString:@"iPad8,8"])      return @"iPad Pro (12.9-inch) (3rd generation)";
     
    if ([phoneType isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([phoneType isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([phoneType isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([phoneType isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";

    if ([phoneType isEqualToString:@"i386"])         return @"Simulator";
    if ([phoneType isEqualToString:@"x86_64"])       return @"Simulator";
    return @"Unknown";
}

#pragma mark -- 获取App版本号
+ (NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

#pragma mark -- 获取App名称
+ (NSString *)getAppName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

#pragma mark -- 获取系统名称
+ (NSString *)getSystemName {
    return [[UIDevice currentDevice] systemName];
}

#pragma mark -- 获取系统版本
+ (NSString *)getSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark -- 获取设备唯一标识符UUID
+ (NSString *)getUUID {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

#pragma mark --获取当前设备可用内存(单位：bit）
+ (double)getAvailableMemory {
  vm_statistics_data_t vmStats;
  mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
  kern_return_t kernReturn = host_statistics(mach_host_self(),
                                            HOST_VM_INFO,
                                             (host_info_t)&vmStats,
                                             &infoCount);
 if (kernReturn != KERN_SUCCESS) {
    return NSNotFound;
  }
  return (vm_page_size *vmStats.free_count);
}

#pragma mark -- 获取总内存大小
+ (long long)getTotalMemorySize {
    return [NSProcessInfo processInfo].physicalMemory;
}

#pragma mark -- 获取当前任务所占用的内存（单位：bit）
+ (double)getUsedMemory{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                          TASK_BASIC_INFO,
                                       (task_info_t)&taskInfo,
                                       &infoCount);
 if (kernReturn != KERN_SUCCESS) {
    return NSNotFound;
  }
    return taskInfo.resident_size;
}

#pragma mark -- 电池电量
+ (long long)getBatteryLevel {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
}

#pragma mark -- 获取精准电池电量
/**
 * @brief 涉及到私有方法 存在AppStore上线问题并未实现
 */
+(long long)getCurrentBatteryLevel {
    return [JXMobileDevice getBatteryLevel];
}

#pragma mark -- 获取电池状态, 共四种
/**
 * @return 四种类型 UnKnow || Unplugged ||  Charging || Full
 */
+(NSString *)getBatteryState {
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return @"UnKnow";
    } else if (device.batteryState == UIDeviceBatteryStateUnplugged){
        return @"Unplugged";
    } else if (device.batteryState == UIDeviceBatteryStateCharging){
        return @"Charging";
    } else if (device.batteryState == UIDeviceBatteryStateFull){
        return @"Full";
    }
    return @"UnKnow";
}

#pragma mark -- 获取当前语言
+(NSString *)getCurrentLanguage {
    NSArray *languageArray = [NSLocale preferredLanguages];
    return [languageArray objectAtIndex:0];
}

#pragma mark -- 获取用户设置的设备名称
+(NSString *)getDeviceName {
    return [[UIDevice currentDevice] name];
}

#pragma mark -- 获取App Bundle ID
+ (NSString *)getAppBundleID {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

#pragma mark -- 手机震动
/**
 *@brief 手机震动 使用此方法首先要在项目中导入AudioToolBox.framework
 *@param complete  震动完成调用此方法
 */
+(void)vibrateShortWithComplete:(JXEventComplete __nullable)complete {
    AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, complete);
}

#pragma mark -- 调节手机亮度
/**
 *@brief 调节手机亮度
 *@param value  参数0~1
 */
+(void)setScreenBright:(CGFloat)value{
    [[UIScreen mainScreen] setBrightness:value];
}

#pragma mark -- 判断是否iPhoneX系列
+ (BOOL)isiPhoneXSeries{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if(@available(iOS 13.0,*)){
        BOOL isX = ([UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame.size.height == 44.0f) ? YES : NO;
        return isX;
    }else{
        BOOL isX = ([[UIApplication sharedApplication] statusBarFrame].size.height == 44.0f) ? YES : NO;
        return isX;
    }
#pragma clang diagnostic pop
}

#pragma mark -- 获取总磁盘容量
+ (NSNumber *)getTotalDiskSpace{
    NSError *err;
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&err];
    NSString *diskTotalSize = [systemAttributes objectForKey:@"NSFileSystemSize"];
    return [NSNumber numberWithFloat:[diskTotalSize floatValue]];
}

#pragma mark -- 磁盘可用容量
+ (NSNumber *)getFreeDiskSpace {
    NSError *err;
    NSDictionary *systemAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&err];
    NSString *diskFreeSize = [systemAttributes objectForKey:@"NSFileSystemFreeSize"];
    return [NSNumber numberWithFloat:[diskFreeSize floatValue]];
}

#pragma mark -- 获取GPRS网络状态
/**
 *@return None | 2G | 3G | 4G | WiFi
 */
+ (NSString *)getGPRSType{
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
       // 保存网络状态
    NSString *states = @"None";
    for (id child in subviews) {
       if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
           //获取到状态栏码
           int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
           switch (networkType) {
               case 0:
                   states = @"None";
                   //无网模式
                   break;
               case 1:
                   states = @"2G";
                   break;
               case 2:
                   states = @"3G";
                   break;
               case 3:
                   states = @"4G";
                   break;
               case 5:
                   states = @"WiFi";
                   break;
               default:
                   break;
            }
        }
    }
           //根据状态选择
           return states;
}




@end
