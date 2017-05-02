//
//  MainTabbarController.m
//  架构
//
//  Created by HM09 on 17/3/26.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "MainTabbarController.h"
//#import "HMAdditions.h"

@interface MainTabbarController ()
@property (nonatomic, assign) BOOL isopen;
@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildControllers];
}

- (void) addChildControllers {
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        UIViewController *controller = [UIViewController new];
        //此处代码可以删除,演示时设置颜色用
        controller.view.backgroundColor = [UIColor colorWithRed:(i+1)*80 /255.0  green:(i+1)*80 / 255.0  blue:(i+1)*80 / 255.0  alpha:1.0 ];
        controller.title = [NSString stringWithFormat:@"控制器%d", i];
        
        controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(itemCliked)];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
        
        [arr addObject:nav];
    }
    
    self.viewControllers = arr;
}

//打开左侧列表页
- (void) itemCliked {
    if (!_isopen) {
        [self.drawer open];
    } else {
        [self.drawer close];
    }
}

//左侧列表已打开
- (void) drawerControllerDidOpen:(ICSDrawerController *)drawerController {
    _isopen = YES;
}

//左侧列表已关闭
- (void) drawerControllerDidClose:(ICSDrawerController *)drawerController {
    _isopen = NO;
}
@end
