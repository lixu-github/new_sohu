//
//  MyDownloader.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "MyDownloader.h"

@implementation MyDownloader

-(instancetype)init
{
    if (self = [super init]) {
        _receiveData = [NSMutableData data];
    }
    return self;
}

-(void)downloadWithUrlString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _conn = [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnection代理
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate downloadFail:self error:error];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.delegate downloadFinish:self];
}



@end
