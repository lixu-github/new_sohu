//
//  InfoModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@interface InfoModel : JSONModel



/*
 "id": 70506645,
 "createTime": "2015-09-20 20:14:39",
 "title": "开轿车也能越野 沃尔沃V60跨界版将在国内上市",
 "header_img_url": "http://n1.itc.cn/img7/adapt/wb/smccloud/sohulife/2015/09/20/144275072828382876_180_180.JPEG",
 "commentCount": 0,
 "brief": ""
 */

@property (nonatomic,assign)NSInteger infoId;
@property (nonatomic,strong)NSString<Optional> *createTime;
@property (nonatomic,strong)NSString<Optional> *title;
@property (nonatomic,strong)NSString<Optional> *header_img_url;
@property (nonatomic,assign)NSInteger commentCount;
@property (nonatomic,strong)NSString<Optional> *brief;

@end
