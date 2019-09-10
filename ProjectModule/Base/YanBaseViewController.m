//
//  YanBaseViewController.m
//  Car
//
//  Created by JG Yan on 2017/12/1.
//  Copyright © 2017年 JG Yan. All rights reserved.
//

#import "UINavigationBar+Utility.h"
#import "BaseViewController.h"

@interface BaseViewController (){
    
        UIButton *_navLeftButton;
}

@property (nonatomic, strong) UIImage *navTitleBtnImage;
@property (nonatomic, strong) NSString *lastTitle;
@property (nonatomic, strong) UIButton *titleBtn;
    

@end

@implementation BaseViewController

@synthesize navRightButton = _navRightButton;
@synthesize navTitle = _navTitle;
@synthesize navTitleColor = _navTitleColor;
@synthesize navLeftBtnTitle = _navLeftBtnTitle;
@synthesize navLeftBtnImage = _navLeftBtnImage;
@synthesize navLeftHighlightBtnImage = _navLeftHighlightBtnImage;
@synthesize navLeftBtnAction = _navLeftBtnAction;
@synthesize navRightBtnTitle = _navRightBtnTitle;
@synthesize navRightBtnImage = _navRightBtnImage;
@synthesize navRightHighlightBtnImage = _navRightHighlightBtnImage;
@synthesize navRightBtnAction = _navRightBtnAction;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;

//    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] init];
//    [backItem setTintColor:[UIColor cz_colorWithHex:0x20ce9c]];
//    backItem.title = @"";
//    self.navigationItem.backBarButtonItem = backItem;
    
     [self customBaseNav];
}

- (void)customBaseNav
{
    [self.view setBackgroundColor:kWhiteColor];
    [self.navigationController.navigationBar KPSetBackgroundColor:kWhiteColor];
    [self.navigationController.navigationBar KPHideShadowImageOrNot:NO];
    
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:NavBackColor withSize:CGSizeMake(KScreenWidth, 64)] forBarMetrics:UIBarMetricsDefault];
    
    self.titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.titleBtn sizeToFit];
    self.navigationItem.titleView = self.titleBtn;
    
    _navLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_navLeftButton setFrame:CGRectMake(0, 0, 35, 35)];
    _navLeftButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    _navRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_navRightButton setFrame:CGRectMake(0, 0, 35, 35)];
    _navRightButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    
    _navLeftButton.exclusiveTouch = YES;
    _navRightButton.exclusiveTouch = YES;
    
    
    if (AboveIOS7)
    {
        _navLeftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        _navRightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navLeftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navRightButton];
    
    [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
    [self.navigationItem.leftBarButtonItem setTintColor:kColor_Nav_Button];
    
    [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStylePlain];
    [self.navigationItem.rightBarButtonItem setTintColor:kColor_Nav_Button];
}


- (void)setNavTitle:(NSString *)navTitle
{
    _navTitle = navTitle;
    
    self.titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.titleBtn setTitle:_navTitle forState:UIControlStateNormal];
    [self.titleBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
    [self.titleBtn setTitleColor:kBlackColor forState:UIControlStateSelected];
    [self.titleBtn setTitle:_navTitle forState:UIControlStateHighlighted];
    [self.titleBtn.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.titleBtn sizeToFit];
    
    
    if (_navTitleBtnImage && ![_navTitle isEqualToString:@""]) {
        CGSize size = [self stringSize:self.titleBtn.titleLabel.text withFont:[UIFont boldSystemFontOfSize:17.f]];
        
        self.titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -_navTitleBtnImage.size.width, 0, _navTitleBtnImage.size.width);
        self.titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, size.width+5, 0, -(size.width+5));
    }
}

- (CGSize)stringSize:(NSString *)string withFont:(UIFont *)font {
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return  [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor
{
    _navTitleColor = navTitleColor;
    
    [self.titleBtn setTitleColor:_navTitleColor forState:UIControlStateNormal];
}

-(void)setNavleftBtnColor:(UIColor*)color
{
    [_navLeftButton setTitleColor:color forState:UIControlStateNormal];
}

- (void)setNavLeftBtnTitle:(NSString *)navLeftBtnTitle {
    
    _navLeftBtnTitle = navLeftBtnTitle;
    [_navLeftButton setTitle:_navLeftBtnTitle forState:UIControlStateNormal];
    [_navLeftButton setTitleColor:kBlackColor forState:UIControlStateNormal];


    float titleW = kGetStringWidth(_navLeftBtnTitle, _navLeftButton.titleLabel.font, 100, 44.f);
    
    CGRect frame = _navLeftButton.frame;
    frame.size.width = titleW;
    _navLeftButton.frame = frame;
    
    if (AboveIOS7) {
         _navLeftButton.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + 5, 0, 0);
    }
}

- (void)setNavLeftBtnImage:(UIImage *)navLeftBtnImage {
    
    _navLeftBtnImage = navLeftBtnImage;
    [_navLeftButton setBounds:CGRectMake(0.f, 0.f, navLeftBtnImage.size.width, navLeftBtnImage.size.height)];
    [_navLeftButton setImage:_navLeftBtnImage forState:UIControlStateNormal];
    
    //-(_navLeftBtnImage.size.width / 2.f + titleW / 2.f + 10.f)
    if (_navLeftBtnTitle && ![_navLeftBtnTitle isEqualToString:@""]) {
        
        float titleW = kGetStringWidth(_navLeftBtnTitle, _navLeftButton.titleLabel.font, 100, 44.f);
        CGRect frame = _navLeftButton.frame;
        frame.size.width = titleW + navLeftBtnImage.size.width + 10;
        _navLeftButton.frame = frame;
        _navLeftButton.titleEdgeInsets = UIEdgeInsetsMake(0.f, -titleW , 0.f, 0.f);
    }
}

- (void)setNavLeftHighlightBtnImage:(UIImage *)navLeftBtnImage {
    _navLeftHighlightBtnImage = navLeftBtnImage;
    [_navLeftButton setBounds:CGRectMake(0.f, 0.f, navLeftBtnImage.size.width, navLeftBtnImage.size.height)];
    [_navLeftButton setImage:_navLeftHighlightBtnImage forState:UIControlStateHighlighted];
}

- (void)setNavLeftBtnAction:(SEL)navLeftBtnAction {
    _navLeftBtnAction = navLeftBtnAction;
    [_navLeftButton addTarget:self action:_navLeftBtnAction forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNavRightBtnTitle:(NSString *)navRightBtnTitle {
    
    _navRightBtnTitle = navRightBtnTitle;
    [_navRightButton.titleLabel setTextAlignment:NSTextAlignmentRight];
    [_navRightButton setTitle:_navRightBtnTitle forState:UIControlStateNormal];
    [_navRightButton setTitle:_navRightBtnTitle forState:UIControlStateHighlighted];
    [_navRightButton setTitleColor:[UIColor cz_colorWithRed:0 green:0 blue:0 alpha:0.6] forState:UIControlStateNormal];
    
    CGSize size = [self stringSize:_navRightBtnTitle withFont:[UIFont systemFontOfSize:14.f]];
    [_navRightButton setFrame:CGRectMake(0, 0, size.width, 33)];
    
    if (AboveIOS7) {
        //        _navRightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -30);
    }
}

- (void)setNavRightBtnImage:(UIImage *)navRightBtnImage {
    
    _navRightBtnImage = nil;
    _navRightBtnImage = navRightBtnImage;
    [_navRightButton setImage:_navRightBtnImage forState:UIControlStateNormal];
    if (_navRightBtnTitle && ![_navRightBtnTitle isEqualToString:@""]) {
        
        float titleW = kGetStringWidth(_navRightBtnTitle, _navRightButton.titleLabel.font, 100, 44.f);
        CGRect frame = _navLeftButton.frame;
        frame.size.width = titleW + _navRightBtnImage.size.width + 10;
        _navRightButton.frame = frame;
        _navRightButton.titleEdgeInsets = UIEdgeInsetsMake(0.f, 10.f, 0.f, 0.f);
    }
}

- (void)setNavRightHighlightBtnImage:(UIImage *)navRightBtnImage {
    _navRightHighlightBtnImage = navRightBtnImage;
    [_navRightButton setBounds:CGRectMake(0, 0, navRightBtnImage.size.width, navRightBtnImage.size.height)];
    [_navRightButton setImage:_navRightHighlightBtnImage forState:UIControlStateHighlighted];
}

- (void)setNavRightBtnAction:(SEL)navRightBtnAction {
    _navRightBtnAction = navRightBtnAction;
    [_navRightButton addTarget:self action:_navRightBtnAction forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)pushViewControllerCus:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:viewController animated:animated];
}


#pragma mark -
#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//ios 6
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    return UIInterfaceOrientationMaskPortrait;
}


@end
