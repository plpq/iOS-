//
//  TestViewController.h
//  ProjectModule
//
//  Created by xianwen on 2019/8/13.
//  Copyright © 2019 xianwen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestViewControllerDelegate <NSObject>

- (void)changeBKColor:(UIColor *)color;

@end

@interface TestViewController : BaseViewController

@property (nonatomic,weak) id <TestViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
