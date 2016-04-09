//
//  DetailDataModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"
#import "DetailModel.h"

@interface DetailDataModel : JSONModel

/*
 "RESULT": {
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
 },
 "STATUS": "0"
 */

@property (nonatomic,strong)DetailModel<Optional> *result;
@property (nonatomic,strong)NSString<Optional> *status;

@end
