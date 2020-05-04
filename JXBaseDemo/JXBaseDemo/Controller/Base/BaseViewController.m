//
//  BaseViewController.m
//  DrinkTea
//
//  Created by _actionsLjx on 2019/9/18.
//  Copyright © 2019 _actionsLjx. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark -- 设置NavigationBar相关
- (void)showBackBtnWithTitle:(NSString * _Nullable )title {
    if(!title){
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"]  style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
        self.navigationItem.leftBarButtonItem = item;
    }else{
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [btn setTitle:title forState:(UIControlStateNormal)];
        [btn setImage:[[UIImage imageNamed:@"nav_back"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(goBack) forControlEvents:(UIControlEventTouchUpInside)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    }
}

-(void)goBack {
    if (self.navigationController.topViewController == self)
       {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }

}

#pragma mark -- 屏幕方向相关

//添加旋转监听
-(void)addDirectionNotification{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}

- (void)delloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)orientChange:(NSNotification *)notification {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    switch (orientation) {
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
        case UIDeviceOrientationPortrait:
            NSLog(@"Home在下方⬇️");
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"Home在上方向上🔼");
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"Home在右方👉");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"Home在左边👈");
            break;
        default:
            break;
    }
}

//手动修改屏幕方向
- (void)changeOrientManual:(UIDeviceOrientation)orientation{
    [UIDevice setValue:[NSNumber numberWithInteger:orientation] forKey:@"orientation"];
}



@end
