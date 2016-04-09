//
//  DetailModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@protocol SubPageModel;

@interface DetailModel : JSONModel

/*
 "author": "文武车道",
 "title": "月销1.7万的宝骏560有啥缺点？",
 "article_id": 70511447,
 "source": "搜狐汽车",
 "review_count": 0,
 "sub_pages": [
 {
 "title": "月销1.7万的宝骏560有啥缺点？",
 "index": 1,
 "url": "http://auto.sohu.com/mapp/newsfile/app/20150920/70511447_1_new.html"
 }
 ],
 "pcurl": "http://3g.k.sohu.com/t/n70511447",
 "modelIds": "",
 "header_img_url": "",
 "date": "2015-09-20 23:01:42",
 "entity_id": "70511447",
 "brief": "月销1.7万的宝骏560有啥缺点？"
 */



@property (nonatomic,strong)NSString<Optional> *author;
@property (nonatomic,strong)NSString<Optional> *title;
@property (nonatomic,assign)NSInteger article_id;
@property (nonatomic,strong)NSString<Optional> *source;
@property (nonatomic,strong)NSString<Optional> *review_count;
@property (nonatomic,strong)NSArray<SubPageModel,Optional> *sub_pages;
@property (nonatomic,strong)NSString<Optional> *pcurl;
@property (nonatomic,strong)NSString<Optional> *modelIds;
@property (nonatomic,strong)NSString<Optional> *header_img_url;
@property (nonatomic,strong)NSString<Optional> *date;
@property (nonatomic,strong)NSString<Optional> *entity_id;
@property (nonatomic,strong)NSString<Optional> *brief;

@end
