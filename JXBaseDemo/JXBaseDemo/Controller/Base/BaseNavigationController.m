//
//  BaseNavigationController.m
//  DrinkTea
//
//  Created by _actionsLjx on 2019/9/18.
//  Copyright © 2019 _actionsLjx. All rights reserved.
//

#import "BaseNavigationController.h"
#import "JXUtils.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor blackColor];
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setBackgroundColor:[UIColor JXColorWithHex:@"#EFF0F4" alpha:1]];
//    self.navigationBarba
//    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    // Do any additional setup after loading the view.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count==1) {
        viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    }
    [super pushViewController:viewController animated:animated];
}


@end
