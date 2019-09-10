//
//  ViewController.m
//  ProjectModule
//
//  Created by xianwen on 2019/8/7.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import "ICUserInfo.h"
#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()<TestViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   // self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"sfsd";

    ICLog(@"%@,%@",APP_BundleID,APP_VERSION);
    ICLog(@"%@",APP_UUID);
    
    ICLog(@"%d,%d,%d,%d,%d,%d",[ICTools isSIMInstalled],[ICTools isMobileNumber:@"1500116884"],[ICTools validateIdentityCard:@"42272519881207317"],[ICTools validateBankCardNumber:@""],[ICTools isAvailableEmail:@"1500010070@qq.com"],[ICTools isTelNumber:@"400-669-5588"]);
    
    
    ICLog(@"%@,%@",[ICTools getCurrentDateString],[ICTools getNowTimeTimestamp]);
    //[ICTools callTelphoneWithNumber:@"15001158834"];
    
    NSString *string = @"sfsdfsda1汉!";
    ICLog(@"%d,%d,%d,%d",[ICTools checkStringIsOnlyDigital:string],[ICTools checkStringIsOnlyLetter:string],[ICTools checkIsHaveNumAndLetter:string],[ICTools checkStringIsContainerChineseCharacter:string]);
    ICLog(@"%@",[ICTools currentViewController]);
    
    ICLog(@"%@",NSStringFromCGPoint(self.view.centerPoint));
    
    [ICUserInfo saveUserInfo:@"haha" forKey:@"111"];
    ICLog(@"%@",[ICUserInfo getUserInfo:@"111"]);
    
    [ICUserInfo removeUserAllInfo];
    ICLog(@"%@",[ICUserInfo getUserInfo:@"111"]);
    
    NSArray *ary = @[@"sfsdfsf"];
    ICLog(@"%@",ary[0]);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSArray *ary = @[@"32"];
    [ary objectAtIndex:0];

    
    TestViewController *testCtl = [[TestViewController alloc]init];
    testCtl.delegate = self;
    [self.navigationController pushViewController:testCtl animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
   // NSLog(@"%d",ICNavigationBarH);
}

#pragma mark- TestViewControllerDelegate

- (void)changeBKColor:(UIColor *)color{
    
    self.view.backgroundColor = color;
}

@end
