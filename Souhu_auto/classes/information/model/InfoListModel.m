//
//  InfoListModel.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "InfoListModel.h"

@implementation InfoListModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"RESULT":@"results",@"STATUS":@"status"}];
}

@end
