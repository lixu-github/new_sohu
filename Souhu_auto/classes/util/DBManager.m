//
//  DownloadManager.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"

@interface DBManager ()

@property (nonatomic,strong)FMDatabase *dataBase;

@end

@implementation DBManager

+(DBManager *)sharedManager
{
    static DBManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[DBManager alloc] init];
    });
    
    return manager;
}

-(instancetype)init
{
    if (self = [super init]) {
        [self createDataBase];
    }
    return self;
}

- (void)createDataBase
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/collect.sqlite"];
    
    self.dataBase = [[FMDatabase alloc] initWithPath:path];
    
    BOOL ret = [self.dataBase open];
    if (ret) {
        
        NSString *sql = @"create table if not exists collect(collectId integer primary key autoincrement, infoId integer, createTime varchar(50), title varchar(255),headImage blob, commentCount integer, brief varchar(255))";
        BOOL flag = [self.dataBase executeUpdate:sql];
        if (!flag) {
            NSLog(@"%@",self.dataBase.lastErrorMessage);
        }
        
    }else{
        NSLog(@"数据库打开失败");
    }
    
}

//收藏
- (void)addCollectItem:(CollectModel *)model
{
    NSString *sql = @"insert into collect (infoId, createTime, title, headImage, commentCount, brief) values (?, ?, ?, ?, ?, ?)";
    NSData *data = UIImagePNGRepresentation(model.headImage);
    BOOL ret = [self.dataBase executeUpdate:sql, @(model.infoId), model.createTime, model.title, data, @(model.commentCount), model.brief];
    if (!ret) {
        NSLog(@"%@",self.dataBase.lastErrorMessage);
    }
    
}

//取消收藏
- (void)deleteCollectItem:(CollectModel *)model
{
    NSString *sql = @"delete from collect where infoId=?";
    
    BOOL ret = [self.dataBase executeUpdate:sql, @(model.infoId)];
    if (!ret) {
        NSLog(@"%@",self.dataBase.lastErrorMessage);
    }
}

//是否收藏
- (BOOL)isFavorite:(NSInteger)infoId
{
    NSString *sql = @"select count(*) as cnt from collect where infoId=?";
    
    FMResultSet *rs = [self.dataBase executeQuery:sql, @(infoId)];
    int count = 0;
    if ([rs next]) {
        count = [rs intForColumn:@"cnt"];
    }
    
    if (count > 0) {
        return YES;
    }else{
        return NO;
    }
}

- (NSArray *)selectAllCollectInfo
{
    NSString *sql = @"select * from collect";
    
    FMResultSet *rs = [self.dataBase executeQuery:sql];
    NSMutableArray *array = [NSMutableArray array];
    
    while ([rs next]) {
        CollectModel *model = [[CollectModel alloc] init];
        model.collectId = [rs intForColumn:@"collectId"];
        model.infoId = [rs intForColumn:@"infoId"];
        model.createTime = [rs stringForColumn:@"createTime"];
        model.title = [rs stringForColumn:@"title"];
        NSData *data = [rs dataForColumn:@"headImage"];
        model.headImage = [UIImage imageWithData:data];
        model.commentCount = [rs intForColumn:@"commentCount"];
        model.brief = [rs stringForColumn:@"brief"];
        
        
        [array addObject:model];
    }
    
    return array;
    
}


@end
