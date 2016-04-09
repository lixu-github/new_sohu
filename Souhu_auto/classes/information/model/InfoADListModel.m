//
//  InfoADListModel.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/21.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "InfoADListModel.h"

@implementation InfoADListModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"RESULT":@"results",@"STATUS":@"status"}];
}

@end
