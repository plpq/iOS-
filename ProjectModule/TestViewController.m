
//
//  TestViewController.m
//  ProjectModule
//
//  Created by xianwen on 2019/8/13.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic,strong) UIView *loadingView;

@end

@implementation TestViewController

- (UIView *)loadingView {
    if (!_loadingView) {
    _loadingView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _loadingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.navLeftBtnTitle = @"返回";
    self.navLeftBtnAction = @selector(leftAction);
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)leftAction{
    
    self.view.backgroundColor = [UIColor redColor];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{

    if ([_delegate respondsToSelector:@selector(changeBKColor:)]) {
        [_delegate changeBKColor:ICRandomColor];
    }
}

- (void)dealloc{
    
    ICLog(@"haha");
}

@end
