//
//  JXTimeUtils.h
//  JXDemo
//
//  Created by _ljx on 2020/1/18.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXTimeUtils : NSObject
#pragma mark -- NSDate 转String
+ (NSString *)formatTimeWithTime:(NSDate *)date formatStr:(NSString *)format;

#pragma mark -- 字符串NSDate
+ (NSDate *)dateWithDateStr:(NSString *)dateStr formatStr: (NSString *)format;

#pragma mark -- 获取两个时间点比较返回字符串
+ (NSString *)dateIntervalFirstDate:(NSDate *)firstDate SecondDate:(NSDate *)secondDate;
@end

NS_ASSUME_NONNULL_END
