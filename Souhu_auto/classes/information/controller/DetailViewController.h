//
//  DetailViewController.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "BaseViewController.h"
#import "CollectModel.h"

@interface DetailViewController : BaseViewController

//图片
@property (nonatomic,strong)UIImage *image;
//模型
@property (nonatomic,strong)CollectModel *model;

//标题
@property (nonatomic,strong)NSString *titleStr;

@end
