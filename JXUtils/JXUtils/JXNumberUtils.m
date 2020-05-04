//
//  JXNumberUtils.m
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXNumberUtils.h"

@implementation JXNumberUtils

#pragma mark -- 格式化缓存大小
/**
@param value 单位为bit转换成的Number对象
 */
+ (NSString *)formatBytesSizeToString:(NSNumber *)value{
    double convertedValue = [value doubleValue];
       int multiplyFactor = 0;
    
       NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB", @"ZB", @"YB",nil];
    
       while (convertedValue > 1024) {
           convertedValue /= 1024;
           multiplyFactor++;
       }
    
       return [NSString stringWithFormat:@"%4.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor]];
}
@end
