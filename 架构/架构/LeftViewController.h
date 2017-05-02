//
//  LeftViewController.h
//  架构
//
//  Created by HM09 on 17/3/26.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ICSDrawerController.h"
#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController <ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
