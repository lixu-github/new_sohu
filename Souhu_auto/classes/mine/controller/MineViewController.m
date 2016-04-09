//
//  MineViewController.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/14.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "MineViewController.h"
#import "MyUtil.h"
#import "CollectViewController.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

//图片
@property (nonatomic,strong)NSArray *imageArray;
//标题
@property (nonatomic,strong)NSArray *titleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self addNavTitle:@"我的"];
    
    //登陆的图片
    [self createLoginView];
    
    //表格
    [self createData];
    [self createTableView];
    
}

- (void)createLoginView
{
    UIImageView *imgView = [MyUtil createImageViewFrame:CGRectMake(0, 64, 375, 160) imageName:@"mySpaceBkgnd"];
    [self.view addSubview:imgView];
    
    UIButton *loginBtn = [MyUtil createBtnFrame:CGRectMake(160, 60, 40, 40) type:UIButtonTypeCustom bgImageName:@"loginPic" title:nil target:self action:@selector(loginAction:)];
    imgView.userInteractionEnabled = YES;
    [imgView addSubview:loginBtn];
}

- (void)loginAction:(id)sender
{}

- (void)createData
{
    self.imageArray = @[@"myFavo",@"myForum",@"myOrder",@"myNews",@"drawlots"];
    
    self.titleArray = @[@"我的收藏",@"我的论坛",@"购车优惠",@"我的通知",@"摇号查询"];
}

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+160, 375, 667-64-49-160) style:UITableViewStylePlain];
    tbView.delegate = self;
    tbView.dataSource = self;
    [self.view addSubview:tbView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CollectViewController *ctrl = [[CollectViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
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
