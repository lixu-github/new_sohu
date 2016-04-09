//
//  DownloadManager.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectModel.h"


@interface DBManager : NSObject

+ (DBManager *)sharedManager;

//收藏
- (void)addCollectItem:(CollectModel *)model;

//取消收藏
- (void)deleteCollectItem:(CollectModel *)model;

//是否收藏
- (BOOL)isFavorite:(NSInteger)infoId;

- (NSArray *)selectAllCollectInfo;


@end
