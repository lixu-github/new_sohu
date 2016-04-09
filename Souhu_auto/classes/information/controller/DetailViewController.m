//
//  DetailViewController.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "DetailViewController.h"
#import "MyDownloader.h"
#import "Const.h"
#import "DetailDataModel.h"
#import "SubPageModel.h"
#import "DBManager.h"
#import "CollectModel.h"

@interface DetailViewController ()<MyDownloaderDelegate>

//是否收藏
@property (nonatomic,assign)BOOL isCollect;

//数据
@property (nonatomic,strong)DetailDataModel *dataModel;

//收藏按钮
@property (nonatomic,strong)UIButton *collectBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航
    [self createMyNav];
    
    //下载数据
    [self downloadData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    BOOL isFavorite = [[DBManager sharedManager] isFavorite:self.model.infoId];
    self.isCollect = isFavorite;
    
    if (isFavorite) {
        [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"new_collect_selected"] forState:UIControlStateNormal];
    }else{
        [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"new_collectBtn_normal"] forState:UIControlStateNormal];
    }
    
    
}


//下载数据
- (void)downloadData
{
    NSString *urlString = [NSString stringWithFormat:kInfoDetailUrl, self.model.infoId];
    
    if (urlString) {
        //下载
        MyDownloader *downloader = [[MyDownloader alloc] init];
        downloader.delegate = self;
        downloader.type = 100;
        [downloader downloadWithUrlString:urlString];
    }
    
    
}


- (void)createMyNav
{
    //返回按钮
    [self addBackBtn:@"back" target:self action:@selector(backAction:)];
    
    //标题
    [self addNavTitle:self.titleStr];
    
    //收藏按钮
    self.collectBtn = [self addNavBtn:@"new_collectBtn_normal" target:self action:@selector(collectAction:) isLeft:NO];
}


- (void)collectAction:(id)sender
{    
    //创建收藏对象
    //图片
    self.model.headImage = self.image;
    
    self.isCollect = !self.isCollect;
    
    if (self.isCollect) {
        [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"new_collect_selected"] forState:UIControlStateNormal];
        
        [[DBManager sharedManager] addCollectItem:self.model];
    }else{
        [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"new_collectBtn_normal"] forState:UIControlStateNormal];
        
        [[DBManager sharedManager] deleteCollectItem:self.model];
    }
    

}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MyDownloader代理
-(void)downloadFail:(MyDownloader *)downloader error:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)downloadFinish:(MyDownloader *)downloader
{
    self.dataModel = [[DetailDataModel alloc] initWithData:downloader.receiveData error:nil];
    
    //网址
    if (self.dataModel.result.sub_pages.count > 0) {
        SubPageModel *subModel = [self.dataModel.result.sub_pages lastObject];
        
        if (subModel.url.length > 0) {
            
            //显示
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64-49)];
            webView.scalesPageToFit = NO;
            
            //请求数据
            NSURL *url = [NSURL URLWithString:subModel.url];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [webView loadRequest:request];
            
            [self.view addSubview:webView];
        }
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
