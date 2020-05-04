//
//  JXTimeUtils.m
//  JXDemo
//
//  Created by _ljx on 2020/1/18.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXTimeUtils.h"

@implementation JXTimeUtils

#pragma mark -- NSDate 转String
/**
 @param format 日期所需要转换的格式 例如填写  yyyy-MM-dd hh:mm:ss
 */
+ (NSString *)formatTimeWithTime:(NSDate *)date formatStr:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

#pragma mark -- 字符串NSDate
/**
@param format 日期字符串的格式  例如填写  yyyy-MM-dd hh:mm:ss
*/
+ (NSDate *)dateWithDateStr:(NSString *)dateStr formatStr: (NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter dateFromString:dateStr];
}

#pragma mark -- 获取两个时间点比较返回字符串
/**
 @param firstDate  初始时间
 @param secondDate 比较时间
 @Return 返回类型  ..年前(后)  ..月前(后) ..天前  ..小时前 ..分钟前  ..刚刚  ..马上
 */
+ (NSString *)dateIntervalFirstDate:(NSDate *)firstDate SecondDate:(NSDate *)secondDate{
    // 2.创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:firstDate toDate:secondDate options:0];
    if(cmps.year != 0){
        return cmps.year > 0 ? [NSString stringWithFormat:@"%ld年前",cmps.year] :[NSString stringWithFormat:@"%ld年后",cmps.year];
    }else if(cmps.month != 0){
        return cmps.month > 0 ? [NSString stringWithFormat:@"%ld月前",cmps.year] :[NSString stringWithFormat:@"%ld月后",cmps.year];
    }else if(cmps.date != 0){
        return cmps.month > 0 ? [NSString stringWithFormat:@"%ld天前",cmps.year] :[NSString stringWithFormat:@"%ld天后",cmps.year];
    }else if(cmps.hour != 0){
        NSNumber *hour = [NSNumber numberWithInteger:cmps.hour];
        if([hour unsignedIntegerValue] > 12){
           return cmps.hour > 0 ? @"半天前" : @"半天后";
        }else{
            return cmps.hour > 0 ? [NSString stringWithFormat:@"%ld小时前",cmps.hour] : [NSString stringWithFormat:@"%ld小时后",cmps.hour];
        }
    }else if(cmps.minute != 0){
        NSNumber *minute = [NSNumber numberWithInteger:cmps.minute];
        if([minute unsignedIntegerValue] > 30){
           return cmps.minute > 0 ? @"半小时前" : @"半小时后";
        }else{
            return cmps.minute > 0 ? [NSString stringWithFormat:@"%ld分钟前",cmps.minute] : [NSString stringWithFormat:@"%ld分钟后",cmps.minute];
        }
    }else {
        NSNumber *sec = [NSNumber numberWithInteger:cmps.second];
        if([sec unsignedIntegerValue] > 30){
           return cmps.second > 0 ? @"1分钟前" : @"1分钟后";
        }else{
            return cmps.second > 0 ? @"刚刚" : @"马上";
        }
    }
}
@end
