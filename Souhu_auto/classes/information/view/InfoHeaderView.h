//
//  InfoHeaderView.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol InfoHeaderViewDelegte <NSObject>

- (void)didSelectType:(NSString *)type titleStr:(NSString *)titleStr;

@end

@interface InfoHeaderView : UIView



@property (nonatomic,weak)id<InfoHeaderViewDelegte> delegate;

//选中的序号
@property (nonatomic,assign)NSInteger sIndex;
//标题数组
@property (nonatomic,strong)NSDictionary *titleDict;
//标题对应的类型值
@property (nonatomic,strong)NSArray *titleArray;

//显示滚动的标题
- (void)configTitle;

@end
