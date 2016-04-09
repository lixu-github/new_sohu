//
//  CollectModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//收藏的模型类
@interface CollectModel : NSObject

@property (nonatomic,assign)NSInteger collectId;
@property (nonatomic,assign)NSInteger infoId;
@property (nonatomic,strong)NSString *createTime;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)UIImage *headImage;
@property (nonatomic,assign)NSInteger commentCount;
@property (nonatomic,strong)NSString *brief;

@end
