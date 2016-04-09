//
//  InfoCell.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"
#import "CollectModel.h"

@interface InfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

//显示数据
- (void)configModel:(InfoModel *)model;

- (void)configCollectModel:(CollectModel *)model;

@end
