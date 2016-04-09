//
//  InfoADModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@interface InfoADModel : JSONModel

/*
"id": 415551575,
"createTime": "2015-06-25 10:40:33",
"title": "自由光等即将国产SUV前瞻",
"header_img_url": "http://auto.sohu.com/mapp/upload/image/2015/06/1435200058171.480.240.jpg",
"brief": ""
 */

@property (nonatomic,assign)NSInteger infoId;
@property (nonatomic,strong)NSString<Optional> *createTime;
@property (nonatomic,strong)NSString<Optional> *title;
@property (nonatomic,strong)NSString<Optional> *header_img_url;
@property (nonatomic,strong)NSString<Optional> *brief;

@end
