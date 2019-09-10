//
//  YanBaseViewController.h
//  Car
//
//  Created by JG Yan on 2017/12/1.
//  Copyright © 2017年 JG Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// 导航栏右边按钮
@property (nonatomic, copy) UIButton *navRightButton;

// 导航栏标题
@property (nonatomic, copy) NSString *navTitle;
//导航栏标题颜色
@property (nonatomic, copy) UIColor *navTitleColor;
// 导航栏左按钮标题
@property (nonatomic, copy) NSString *navLeftBtnTitle;
// 导航栏左按钮图片
@property (nonatomic, retain) UIImage *navLeftBtnImage;

@property (nonatomic, retain) UIImage *navLeftHighlightBtnImage;
// 导航栏左按钮响应方法
@property (nonatomic, assign) SEL navLeftBtnAction;
// 导航栏右按钮标题
@property (nonatomic, copy) NSString *navRightBtnTitle;
// 导航栏右按钮图片
@property (nonatomic, retain) UIImage *navRightBtnImage;

@property (nonatomic, retain) UIImage *navRightHighlightBtnImage;
// 导航栏右按钮响应方法
@property (nonatomic, assign) SEL navRightBtnAction;

- (void)pushViewControllerCus:(UIViewController *)viewController animated:(BOOL)animated;


@end
