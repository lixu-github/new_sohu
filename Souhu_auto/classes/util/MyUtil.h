//
//  MyUtil.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/20.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyUtil : NSObject

+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title;

+ (UIButton *)createBtnFrame:(CGRect)frame type:(UIButtonType)type bgImageName:(NSString *)bgImageName title:(NSString *)title target:(id)target action:(SEL)action;

+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;

@end
