//
//  JXDocumentUtils.h
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXDocumentUtils : NSObject
+ (NSString *)getHomeRootPath;
+ (NSString *)getLibraryPath;
+ (NSString *)getDocumentPath;
+ (NSString *)getTmpPath;
@end

NS_ASSUME_NONNULL_END
