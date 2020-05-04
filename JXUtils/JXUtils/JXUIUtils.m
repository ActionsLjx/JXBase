//
//  JXUIUtils.m
//  JXDemo
//
//  Created by _ljx on 2020/1/14.
//  Copyright © 2020 _ljx. All rights reserved.
//

#import "JXUIUtils.h"

@implementation JXUIUtils
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    #pragma clang diagnostic pop
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    }else{
        result = window.rootViewController;
    }
    UINavigationController * navc;
    if([result isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabController = (UITabBarController*)result;
        navc = tabController.selectedViewController;
    }else if ([result isKindOfClass:[UINavigationController class]]){
        navc = (UINavigationController*)result;
    }else{
        while (result.presentedViewController) {
            result = result.presentedViewController;
        }
        return result;
    }
    result = navc.viewControllers.lastObject;
    while (result.presentedViewController && ![result.presentedViewController isKindOfClass:[UIAlertController class]]) {
        result = result.presentedViewController;
    }
    
    if ([result isKindOfClass:[UINavigationController class]]){
        result = ((UINavigationController *)result).viewControllers.lastObject;
    }
    
    return result;
}
@end
