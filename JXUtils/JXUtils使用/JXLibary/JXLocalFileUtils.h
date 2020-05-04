//
//  JXLocalFileUtils.h
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXLocalFileUtils : NSObject

#pragma mark -- Userdefaults 部分

#pragma mark -- Userdefaults get
+ (id)userDefaultsGetByKey:(NSString *)key;

#pragma mark -- Userdefaults set
+ (void)userDefaultsSetObj:(id)value key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
