//
//  InfoTextCell.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "InfoTextCell.h"

@implementation InfoTextCell

-(void)configModel:(InfoModel *)model
{

    //标题
    self.titleLabel.text = model.title;
    self.titleLabel.numberOfLines = 2;
    //时间
    NSArray *dayStr = [model.createTime componentsSeparatedByString:@" "];
    self.timeLabel.text = [dayStr firstObject];
    //评论
    self.commentLabel.text = [NSString stringWithFormat:@"%ld",model.commentCount];
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
