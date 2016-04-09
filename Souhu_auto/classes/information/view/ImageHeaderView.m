//
//  ImageHeaderView.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "ImageHeaderView.h"
#import "UIImageView+WebCache.h"
#import "InfoModel.h"
#import "MyUtil.h"


@interface ImageHeaderView ()<UIScrollViewDelegate>

//滚动视图
@property (nonatomic,strong)UIScrollView *scrollView;
//红色视图
@property (nonatomic,strong)UIView *redView;

@end

@implementation ImageHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //滚动视图
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        
        self.redView = [[UIView alloc] initWithFrame:CGRectZero];
        self.redView.backgroundColor = [UIColor redColor];
        [self addSubview:self.redView];
        
    }
    return self;
}

-(void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    for (int i=0; i<modelArray.count; i++) {
        InfoADModel *model = modelArray[i];

        //图片
        UIImageView *imgView = [MyUtil createImageViewFrame:CGRectMake(375*i, 0, 375, 160) imageName:nil];
        [imgView sd_setImageWithURL:[NSURL URLWithString:model.header_img_url]];
        imgView.tag = 200+i;
        imgView.userInteractionEnabled = YES;
        [self.scrollView addSubview:imgView];
        
        UILabel *titleLabel = [MyUtil createLabelFrame:CGRectMake(20, 130, 300, 30) title:model.title];
        titleLabel.opaque = YES;
        titleLabel.textColor = [UIColor whiteColor];
        [imgView addSubview:titleLabel];
        
        //点击事件
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imgView addGestureRecognizer:g];
    }
    
    
    self.scrollView.contentSize = CGSizeMake(375*modelArray.count, 160);
    
    //红色视图
    self.redView.frame = CGRectMake(0, 158, 375.0f/modelArray.count, 2);
    
    
}

- (void)tapAction:(UIGestureRecognizer *)g
{
    UIImageView *imgView = (UIImageView *)g.view;
    
    NSInteger index = imgView.tag-200;
    
    InfoADModel *model = self.modelArray[index];
    
    [self.delegate didTapInfoModel:model image:imgView.image];
}

#pragma mark - UIScrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    CGRect frame = self.redView.frame;
    frame.origin.x = frame.size.width*index;
    [UIView animateWithDuration:0.01 animations:^{
        self.redView.frame = frame;
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
