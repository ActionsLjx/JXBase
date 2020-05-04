//
//  JXLocalFileUtils.m
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXLocalFileUtils.h"

@implementation JXLocalFileUtils

#pragma mark -- Userdefaut

/**
 *@brief 设置Userdefaults 任何参数都可传 特殊类型需要转换成对象
 * 例如 数据类型转NSNumber BOOL 类型写成@(YES )
 *@Param value  对象类型
 */
+ (void)userDefaultsSetObj:(id)value key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *@brief 根据键值取出
 *@discussion  *特殊类型例 \n数据类型  NSNumber   NSNumber *number;     [number floatValue]
 *BOOL类型  [value boolValue];
 *@return 返回参数直接转成对应类型即可
 */
+ (id)userDefaultsGetByKey:(NSString *)key{
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return value;
}
@end
