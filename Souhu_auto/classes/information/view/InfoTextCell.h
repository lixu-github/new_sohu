//
//  InfoTextCell.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"

@interface InfoTextCell : UITableViewCell

/*
 没有图片的cell
 */

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

//显示数据
- (void)configModel:(InfoModel *)model;

@end
