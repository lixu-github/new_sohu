//
//  BaseViewController.h
//  Souhu_auto
//
//  Created by gaokunpeng on 15/9/14.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)addNavTitle:(NSString *)title;

- (UIButton *)addNavBtn:(NSString *)imageName target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

- (void)addBackBtn:(NSString *)imageName target:(id)target action:(SEL)action;

@end
