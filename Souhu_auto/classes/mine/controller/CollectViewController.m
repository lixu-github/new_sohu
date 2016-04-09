//
//  CollectViewController.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectModel.h"
#import "InfoCell.h"
#import "DBManager.h"
#import "DetailViewController.h"

@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>

//数据源
@property (nonatomic,strong)NSMutableArray *dataArray;
//表格
@property (nonatomic,strong)UITableView *tbView;


@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addBackBtn:@"back" target:self action:@selector(backAction:)];
    
    
    [self addNavTitle:@"我的收藏"];
    
    
    [self createTableView];

    
}

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64-49) style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self.view addSubview:self.tbView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *array = [[DBManager sharedManager] selectAllCollectInfo];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    
    [self.tbView reloadData];
    
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"infoCellId";
    
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell" owner:nil options:nil] lastObject];
    }
    
    CollectModel *model = self.dataArray[indexPath.row];
    [cell configCollectModel:model];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectModel *model = self.dataArray[indexPath.row];
    
    DetailViewController *dCtrl = [[DetailViewController alloc] init];
    dCtrl.model = model;
    dCtrl.image = model.headImage;
    [self.navigationController pushViewController:dCtrl animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectModel *model = self.dataArray[indexPath.row];
    
    [[DBManager sharedManager] deleteCollectItem:model];
    
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.tbView reloadData];
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
