//
//  InfoHeaderView.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "InfoHeaderView.h"
#import "MyUtil.h"

@interface InfoHeaderView ()

//背景视图
@property (nonatomic,strong)UIView *bgView;
//按钮列表
@property (nonatomic,strong)UIView *listBgView;

//标题的滚动视图
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation InfoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //滚动视图
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375-60, 30)];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        
        //按钮
        UIButton *btn = [MyUtil createBtnFrame:CGRectMake(375-50, 0, 30, 30) type:UIButtonTypeCustom bgImageName:@"showItemView" title:nil target:self action:@selector(clickBtn:)];
        [self addSubview:btn];
        
        
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0f];
        
    }
    return self;
}

//显示滚动的标题
- (void)configTitle
{
    CGFloat w = 60;
    CGFloat h = 30;
    CGFloat spaceX = 20;
    CGFloat offsetX = 20;
    
    for (int i=0; i<self.titleArray.count; i++) {
        NSString *title = self.titleArray[i];
        
        
        CGRect frame = CGRectMake(offsetX+(w+spaceX)*i, 0, w, h);
        UIButton *btn = [MyUtil createBtnFrame:frame type:UIButtonTypeCustom bgImageName:nil title:title target:self action:@selector(selectTitle:)];
        if (i == self.sIndex) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        btn.tag = 1000+i;
        [self.scrollView addSubview:btn];
    }
    
    
    
    self.scrollView.contentSize = CGSizeMake((w+spaceX)*self.titleArray.count, 30);
}


//点击标题的按钮
- (void)selectTitle:(UIButton *)btn
{
    NSInteger index = btn.tag-1000;
    
    [self selectBtnAtIndex:index];
}




-(void)dealloc
{
    [self hideBgView];
}


//点击展开按钮
- (void)clickBtn:(id)sender
{
    //背景图片
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64)];
    self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.alpha = 0.4;
    
    [self.superview addSubview:self.bgView];
    
    
    
    //添加按钮列表
    self.listBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 375, 150)];
    self.listBgView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0f];
    [self.superview addSubview:self.listBgView];
    
    //添加标题
    UILabel *titleLabel = [MyUtil createLabelFrame:CGRectMake(20, 8, 72, 20) title:@"切换栏目"];
    [self.listBgView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 375, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.listBgView addSubview:lineView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 30, 72, 1)];
    redView.backgroundColor = [UIColor redColor];
    [self.listBgView addSubview:redView];
    
    UIButton *closeBtn = [MyUtil createBtnFrame:CGRectMake(375-50, 0, 30, 30) type:UIButtonTypeCustom bgImageName:@"closeItemView" title:nil target:self action:@selector(closeAction:)];
    [self.listBgView addSubview:closeBtn];
    
    //列表
    CGFloat h = 30;
    CGFloat spaceY = 20;
    CGFloat offsetY = 50;
    CGFloat w = 60;
    CGFloat spaceX = 20;
    CGFloat offsetX = 20;
    for (int i=0; i<self.titleArray.count; i++) {
        
        int row = i/4;
        int col = i%4;
        
        CGRect frame = CGRectMake(offsetX+(w+spaceX)*col, offsetY+(h+spaceY)*row, w, h);
        UIButton *btn = [MyUtil createBtnFrame:frame type:UIButtonTypeCustom bgImageName:@"zhankai_bg" title:self.titleArray[i] target:self action:@selector(selectAction:)];
        btn.tag = 200+i;
        if (i == self.sIndex) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
        [self.listBgView addSubview:btn];
        
    }
    
    
    
}


//点击弹出列表上面的按钮
- (void)selectAction:(UIButton *)btn
{
    NSInteger index = btn.tag-200;
    
    [self selectBtnAtIndex:index];
    
    [self hideBgView];
}


//选中某个序号的按钮
- (void)selectBtnAtIndex:(NSInteger)index
{
    NSString *title = self.titleArray[index];
    NSString *type = self.titleDict[title];
    
    
    //修改UI
    UIButton *lastSelectBtn = (UIButton *)[self viewWithTag:1000+self.sIndex];
    [lastSelectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *curSelectBtn = (UIButton *)[self viewWithTag:1000+index];
    [curSelectBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //设置选中序号
    self.sIndex = index;
    
    //重新显示数据
    [self.delegate didSelectType:type titleStr:title];
    
    //修改滚动视图的偏移量
    CGFloat x = self.sIndex*(60+20);
    if (x+self.scrollView.bounds.size.width >= self.scrollView.contentSize.width) {        
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width-self.scrollView.bounds.size.width, 0);
    }else{
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }
    
    
}


//隐藏背景视图
- (void)hideBgView
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    
    [self.listBgView removeFromSuperview];
    self.listBgView = nil;
}

//取消选择
- (void)closeAction:(id)sender
{
    [self hideBgView];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
