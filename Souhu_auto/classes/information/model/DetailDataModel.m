//
//  DetailDataModel.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "DetailDataModel.h"

@implementation DetailDataModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"RESULT":@"result",@"STATUS":@"status"}];
}

@end
