//
//  AppDelegate.m
//  架构
//
//  Created by HM09 on 17/3/26.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbarController.h"
#import "LeftViewController.h"
#import "ICSDrawerController.h"
@interface AppDelegate ()
@property (nonatomic, strong) MainTabbarController *mainController;
@property (nonatomic, strong) LeftViewController *leftController;
@property (nonatomic, strong) ICSDrawerController *iSCDController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.iSCDController;
    [_window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - 懒加载
- (ICSDrawerController *)iSCDController{
        if (!_iSCDController) {
        _iSCDController = [[ICSDrawerController alloc]initWithLeftViewController:self.leftController centerViewController:self.mainController];
    }
    return _iSCDController;
}

- (MainTabbarController *)mainController{
    if (!_mainController) {
        _mainController = [[MainTabbarController alloc]init];
    }
    return _mainController;
}


- (LeftViewController *)leftController{
    if (!_leftController) {
        _leftController = [[LeftViewController alloc]init];

    }
    return _leftController;
}



@end
