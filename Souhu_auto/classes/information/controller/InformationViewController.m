//
//  InformationViewController.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/14.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "InformationViewController.h"
#import "MJRefresh.h"
#import "Const.h"
#import "InfoCell.h"
#import "InfoModel.h"
#import "InfoListModel.h"
#import "MyDownloader.h"
#import "InfoHeaderView.h"
#import "InfoTextCell.h"
#import "DetailViewController.h"
#import "InfoADListModel.h"
#import "ImageHeaderView.h"

@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate,MyDownloaderDelegate,InfoHeaderViewDelegte,ImageHeaderViewDelegate>

//表格
@property (nonatomic,strong)UITableView *tbView;
//数据源
@property (nonatomic,strong)InfoListModel *listModel;
//广告数据
@property (nonatomic,strong)InfoADListModel *adListModel;
//下拉刷新
@property (nonatomic,strong)MJRefreshHeaderView *headerView;
@property (nonatomic,strong)MJRefreshFooterView *footerView;
@property (nonatomic,strong)NSString *lastId;
@property (nonatomic,assign)BOOL isLoading;

//类型的标题
@property (nonatomic,strong)InfoHeaderView *infoTitleView;

//选中的标题
@property (nonatomic,strong)NSString *titleStr;



//类型(用来区分资讯页面的不同类型)
@property (nonatomic,strong)NSString *newsType;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //标题
    [self addNavTitle:@"资讯"];
    
    //默认是最新的tab
    self.newsType = @"11";
    
    //标题
    [self createTitleView];
    //表格
    [self createTableView];
    //刷新
    [self createRefresh];
    
    //下载列表数据
    [self downloadData];
    
    //下载广告数据
    [self downloadAdData];
    
    
}

//下载广告数据
- (void)downloadAdData
{
    NSString *urlString = [NSString stringWithFormat:kInfoAdUrl, self.newsType];
    
    MyDownloader *downloader = [[MyDownloader alloc] init];
    downloader.type = 200;
    downloader.delegate = self;
    [downloader downloadWithUrlString:urlString];
}


//标题
- (void)createTitleView
{
    self.infoTitleView = [[InfoHeaderView alloc] initWithFrame:CGRectMake(0, 64, 375, 30)];
    self.infoTitleView.titleArray = @[@"最新",@"新车",@"导购",@"评测",@"行情",@"视频",@"车迷"];
    self.infoTitleView.titleDict = @{@"最新":@"11",@"新车":@"4",@"导购":@"3",@"评测":@"1",@"行情":@"2",@"视频":@"13",@"车迷":@"14"};
    //设置代理
    self.infoTitleView.delegate = self;
    
    
    //显示标题
    [self.infoTitleView configTitle];
    //选中标题
    self.titleStr = [self.infoTitleView.titleArray firstObject];
    
    [self.view addSubview:self.infoTitleView];
}


//表格
- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+30, 375, 667-64-30-49) style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self.view addSubview:self.tbView];

}

//下拉刷新
- (void)createRefresh
{
    self.headerView = [MJRefreshHeaderView header];
    self.headerView.scrollView = self.tbView;
    self.headerView.delegate = self;
    
    
    self.footerView = [MJRefreshFooterView footer];
    self.footerView.scrollView = self.tbView;
    self.footerView.delegate = self;
}

-(void)dealloc
{
    self.headerView.scrollView = nil;
    self.footerView.scrollView = nil;
}

//下载数据
- (void)downloadData
{
    //进入下载
    self.isLoading = YES;
    
    NSString *urlString = [NSString stringWithFormat:kInfoListUrl,self.newsType];
    
    if (self.lastId) {
        urlString = [NSString stringWithFormat:kInfoMoreListUrl, self.lastId, self.newsType];
    }
    
    //行情
    if ([self.newsType isEqualToString:@"2"]) {
        urlString = [urlString stringByAppendingString:@"&cityCode=110000"];
    }
    
    
    MyDownloader *downloader = [[MyDownloader alloc] init];
    downloader.delegate = self;
    downloader.type = 100;
    [downloader downloadWithUrlString:urlString];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listModel.results.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    InfoModel *model = self.listModel.results[indexPath.row];
    
    if (model.header_img_url.length == 0) {
        
        //没有图片的cell
        static NSString *cellId = @"infoTextCellId";
        
        InfoTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoTextCell" owner:nil options:nil] lastObject];
        }
        
        //显示数据
        [cell configModel:model];
        return cell;
        
        
    }else{
        
        //有图片的cell
        static NSString *cellId = @"infoCellId";
        
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell" owner:nil options:nil] lastObject];
        }
        
        //显示数据
        [cell configModel:model];
        return cell;
    }
    
    
}


//点击进详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoModel *model = self.listModel.results[indexPath.row];
    
    
    CollectModel *collectModel = [[CollectModel alloc] init];
    collectModel.infoId = model.infoId;
    collectModel.createTime = model.createTime;
    collectModel.title = model.title;
    collectModel.commentCount = model.commentCount;
    collectModel.brief = model.brief;

    
    DetailViewController *dCtrl = [[DetailViewController alloc] init];
    dCtrl.model = collectModel;
    dCtrl.titleStr = self.titleStr;
    
    //图片
    UITableViewCell *cell = [self.tbView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[InfoCell class]]) {
        InfoCell *infoCell = (InfoCell *)cell;
        dCtrl.image = infoCell.infoImageView.image;
    }
    
    [self.navigationController pushViewController:dCtrl animated:YES];
}

#pragma mark - MyDownloader代理
- (void)downloadFail:(MyDownloader *)downloader error:(NSError *)error
{
    NSLog(@"%@",error);
    
    self.isLoading = NO;
    [self.headerView endRefreshing];
    [self.footerView endRefreshing];
}

-(void)downloadFinish:(MyDownloader *)downloader
{
    if (downloader.type == 100) {
        //列表
        InfoListModel *dataModel = [[InfoListModel alloc] initWithData:downloader.receiveData error:nil];
        if (self.lastId == nil) {
            self.listModel = dataModel;
        }else{
            [self.listModel.results addObjectsFromArray:dataModel.results];
        }
        
        
        //更新下拉刷新的数据
        if (self.listModel.results.count > 0) {
            InfoModel *model = [self.listModel.results lastObject];
            self.lastId = [NSString stringWithFormat:@"%ld", model.infoId];
        }
        
        //刷新
        [self.tbView reloadData];
        self.isLoading = NO;
        [self.headerView endRefreshing];
        [self.footerView endRefreshing];
        
        
    }else if (downloader.type == 200){
        
        
        //广告数据
        self.adListModel = [[InfoADListModel alloc] initWithData:downloader.receiveData error:nil];
        
        if ([self.newsType isEqualToString:@"11"]) {
            //最新界面显示
            ImageHeaderView *headerView = [[ImageHeaderView alloc] initWithFrame:CGRectMake(0, 0, 375, 160)];
            headerView.modelArray = self.adListModel.results;
            headerView.delegate = self;
            self.tbView.tableHeaderView = headerView;
            
            
        }else{
            //其他界面不显示
            self.tbView.tableHeaderView = nil;
        }
        
        
        
    }
}


#pragma mark - MJRefreshBaseView代理
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (self.isLoading) {
        return;
    }
    
    
    if (refreshView == self.headerView) {
        
        self.lastId = nil;
        
        [self downloadData];
        
        [self downloadAdData];
    }else if (refreshView == self.footerView){
        
        [self downloadData];
        
    }
}

#pragma mark - InfoHeaderView代理
-(void)didSelectType:(NSString *)type titleStr:(NSString *)titleStr
{
    self.lastId = nil;
    
    self.newsType = type;
    
    self.titleStr = titleStr;
    
    
    //重新下载数据
    self.tbView.tableHeaderView = nil;
    [self downloadData];
    
    [self downloadAdData];
    
    self.tbView.contentOffset = CGPointZero;
}

#pragma mark - ImageHeaderView代理
-(void)didTapInfoModel:(InfoADModel *)model image:(UIImage *)image
{
    DetailViewController *dCtrl = [[DetailViewController alloc] init];
    
    
    CollectModel *collectModel = [[CollectModel alloc] init];
    
    collectModel.infoId = model.infoId;
    collectModel.createTime = model.createTime;
    collectModel.title = model.title;
    collectModel.commentCount = 0;
    collectModel.brief = model.brief;
    
    dCtrl.model = collectModel;
    dCtrl.titleStr = @"最新";
    dCtrl.image = image;
    [self.navigationController pushViewController:dCtrl animated:YES];
    
    
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
