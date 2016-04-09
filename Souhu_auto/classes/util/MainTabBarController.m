//
//  MainTabBarController.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/14.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.backgroundImage = [[UIImage imageNamed:@"tabbar"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    
    //创建视图控制器
    [self createViewControllers];
}

//创建视图控制器
- (void)createViewControllers
{
    NSArray *ctrlArray = @[@"InformationViewController",@"SearchViewController",@"IndulgenceViewController",@"ForumViewController",@"MineViewController"];
    NSArray *titleArray = @[@"资讯",@"找车",@"特惠",@"论坛",@"我的"];
    NSArray *imageArray = @[@"tab_news_normal",@"tab_selectCar_normal",@"tab_preferentialCar_normal",@"tab_forum_normal",@"tab_forum_normal"];
    NSArray *selectImageArray = @[@"tab_news_highlighted",@"tab_selectCar_highlighted",@"tab_preferentialCar_highlighted",@"tab_forum_highlighted",@"tab_forum_highlighted"];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<ctrlArray.count; i++) {
        Class cls = NSClassFromString(ctrlArray[i]);
        
        UIViewController *vc = [[cls alloc] init];
        vc.tabBarItem.title = titleArray[i];
        vc.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [array addObject:navCtrl];
        
        
    }
    
    
    self.viewControllers = array;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
