//
//  InfoListModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@protocol InfoModel;
@interface InfoListModel : JSONModel

@property (nonatomic,strong)NSMutableArray<InfoModel,Optional> *results;
@property (nonatomic,strong)NSString<Optional> *status;

@end
