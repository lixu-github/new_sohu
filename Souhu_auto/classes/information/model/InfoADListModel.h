//
//  InfoADListModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@protocol InfoADModel;
@interface InfoADListModel : JSONModel

@property (nonatomic,strong)NSArray<InfoADModel,Optional> *results;
@property (nonatomic,strong)NSString<Optional> *status;

@end
