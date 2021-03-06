//
//  AppDelegate.m
//  GuoKe
//
//  Created by 林俊炳 on 16/1/12.
//  Copyright © 2016年 ljunb. All rights reserved.
//

#import "AppDelegate.h"
#import <IIViewDeckController.h>
#import "LJBSliderMenuController.h"
#import "LJBRootController.h"

CGFloat const kViewDeckLeftSize = 100;


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LJBRootController * rootVC = [[LJBRootController alloc] init];
    
    LJBSliderMenuController * sliderVC = [[LJBSliderMenuController alloc] init];
    
    // 设置代理
    sliderVC.delegate = rootVC;
    
    // 初始化ViewDeck控制器
    IIViewDeckController * viewDeckVC = [[IIViewDeckController alloc] initWithCenterViewController:rootVC leftViewController:sliderVC];
    viewDeckVC.leftSize = kViewDeckLeftSize;
    
    // 创建UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = viewDeckVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
