//
//  MyUtil.m
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+(UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    return label;
}

+ (UIButton *)createBtnFrame:(CGRect)frame type:(UIButtonType)type bgImageName:(NSString *)bgImageName title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    imgView.image = [UIImage imageNamed:imageName];
    return imgView;
}

@end
