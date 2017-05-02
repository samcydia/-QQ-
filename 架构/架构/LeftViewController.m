//
//  LeftViewController.m
//  架构
//
//  Created by HM09 on 17/3/26.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "LeftViewController.h"
#import "MainTabbarController.h"
//#import "HMAdditions.h"
static NSString *identifer = @"identifier";

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifer];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  20;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor purpleColor];
    [self skipToViewController:controller title: @(indexPath.row).description];
}

#pragma mark - leftBar控制器跳转
- (void)skipToViewController:(UIViewController *)viewController title:(NSString *)title{
    //设置title
    viewController.title = title;
    viewController.hidesBottomBarWhenPushed = YES;
    
    //获取导航控制器
    MainTabbarController *tab = (MainTabbarController *)self.drawer.centerViewController;
    UINavigationController *nav = tab.selectedViewController;
    [nav popToRootViewControllerAnimated:NO];
    
    //关闭左侧列表
    [self.drawer close];
    [nav pushViewController:viewController animated:NO];
}

@end
