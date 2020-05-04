//
//  JXDocumentUtils.m
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXDocumentUtils.h"

@implementation JXDocumentUtils

+ (NSString *)getHomeRootPath{
    return NSHomeDirectory();
}

+ (NSString *)getLibraryPath{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getDocumentPath{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)getTmpPath {
    return NSTemporaryDirectory();
}


@end
