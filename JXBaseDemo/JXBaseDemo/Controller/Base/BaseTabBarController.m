//
//  BaseTabBarController.m
//  CloudDist
//
//  Created by _actionsLjx on 2019/9/20.
//  Copyright © 2019 _actionsLjx. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import <Foundation/Foundation.h>
#import "JXUtils.h"
@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configChileController];
    self.delegate = self;
    UIColor *defaultColor = [UIColor blackColor];
    UIColor *selectColor = [UIColor whiteColor];
    self.tabBar.tintColor = selectColor; // 这个是选中状态的时候的颜色
    // 这个是未选中的颜色
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = defaultColor;
    }
}



-(void)configChileController{
    
    UIColor *defaultColor = [UIColor blackColor];
    UIColor *selectColor = [UIColor whiteColor];
    
    
    [self setViewControllers:@[]];
    
}

-(UIViewController *)configTabBarController:(UIViewController *)vc title:(NSString *)title imageNameName:(NSString *)imageName selectImgName:(NSString *)selectImgName defaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor {
    vc.tabBarItem.title = title;
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:(UIControlStateNormal)];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:defaultColor} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor} forState:UIControlStateSelected];
    [vc.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]];
    [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImgName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]];
    BaseNavigationController *root = [[BaseNavigationController alloc]initWithRootViewController:vc];
    return root;
}



@end
