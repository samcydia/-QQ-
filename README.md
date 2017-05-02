# -QQ-
类似QQ抽屉效果的小demo,性能优化无卡顿,效率高,集成只需几句代码,方便大家使用~

根据演示代码,将ICSDrawerController文件,LeftViewController.h/LeftViewController.m,MainTabbarController.h/MainTabbarController.m拖入到工程内.

根据实际项目需求更改MainTabbarController.m中Tabbar的显示文字.

在AppDelegate.m中导入上面添加的3个.h文件.

复制以下代码到AppDelegate.中


@interface AppDelegate ()

//将上面导入的3个控制器设置为属性

@property (nonatomic, strong) MainTabbarController *mainController;

@property (nonatomic, strong) LeftViewController *leftController;

@property (nonatomic, strong) ICSDrawerController *iSCDController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen] bounds]];
    
    //将添加导入的ICSDrawerController对象设置为根控制器
    
    self.window.rootViewController = self.iSCDController;
    
    [_window makeKeyAndVisible];
    
    return YES;
    
}


#pragma mark - 懒加载属性

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

效果图如下:

![image](https://github.com/samcydia/-QQ-/blob/master/演示图片/chouti.gif)
