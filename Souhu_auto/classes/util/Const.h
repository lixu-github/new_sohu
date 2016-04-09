//
//  Const.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/19.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#ifndef Souhu_auto_Const_h
#define Souhu_auto_Const_h


//1.资讯

#define kInfoAdUrl         (@"http://mobile.auto.sohu.com/mcms/external/getFocusNews.at?newsType=%@")
#define kInfoListUrl       (@"http://mobile.auto.sohu.com/mcms/external/getNews.at?newsType=%@&pageSize=20")
#define kInfoMoreListUrl   (@"http://mobile.auto.sohu.com/mcms/external/getNews.at?lastId=%@&newsType=%@&pageSize=20")

//  1->20   id = 2314
//lastId=2314

//例如lastId=70417333
#define kInfoDetailUrl     (@"http://mobile.auto.sohu.com/mcms/external/queryNewsDetail.at?articleId=%ld&storeType=1")
//例如articleId=70410032


//1)最新
//newsType=11
//2)新车
//newsType=4
//3)导购
//newsType=3
//4)评测
//newsType=1
//5)行情
//newsType=2
//6)视频
//newsType=13
//7)车迷
//newsType=14



//2.找车


//3.特惠

//4.论坛


//5.我的




#endif
