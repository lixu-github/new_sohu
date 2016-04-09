//
//  ImageHeaderView.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoADModel.h"

@protocol ImageHeaderViewDelegate <NSObject>

- (void)didTapInfoModel:(InfoADModel *)model image:(UIImage *)image;

@end

@interface ImageHeaderView : UIView

//显示图片对象的数组
@property (nonatomic,strong)NSArray *modelArray;
//代理
@property (nonatomic,weak)id<ImageHeaderViewDelegate> delegate;

@end
