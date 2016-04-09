//
//  SubPageModel.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "JSONModel.h"

@interface SubPageModel : JSONModel

/*
 "title": "月销1.7万的宝骏560有啥缺点？",
 "index": 1,
 "url": "http://auto.sohu.com/mapp/newsfile/app/20150920/70511447_1_new.html"
 */

@property (nonatomic,strong)NSString *title;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSString<Optional> *url;

@end
