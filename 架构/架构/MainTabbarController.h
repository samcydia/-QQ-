//
//  MainTabbarController.h
//  架构
//
//  Created by HM09 on 17/3/26.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface MainTabbarController : UITabBarController <ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
