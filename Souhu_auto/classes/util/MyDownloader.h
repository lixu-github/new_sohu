//
//  MyDownloader.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyDownloader;
@protocol MyDownloaderDelegate <NSObject>

//下载失败
- (void)downloadFail:(MyDownloader *)downloader error:(NSError *)error;
//下载成功
- (void)downloadFinish:(MyDownloader *)downloader;

@end

@interface MyDownloader : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData *_receiveData;
    
    NSURLConnection *_conn;
}

//代理属性
@property (nonatomic,weak)id<MyDownloaderDelegate> delegate;
@property (nonatomic,strong)NSData *receiveData;
//类型
@property (nonatomic,assign)NSInteger type;

//下载
- (void)downloadWithUrlString:(NSString *)urlString;


@end
