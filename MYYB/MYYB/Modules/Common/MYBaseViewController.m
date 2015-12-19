//
//  MYBaseViewController.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYBaseViewController.h"

@interface MYBaseViewController ()

@property(nonatomic,retain)UIView* lineView;

@end

@implementation MYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //通用VC底色
    self.view.backgroundColor = HEX(0xeeeeee);
    //隐藏默认的顶栏
    self.navigationController.navigationBarHidden = YES;
    //兼容IOS6 和 IOS7
    CGFloat height = [MYCommon isLessThanIphone5]?54:64;
    CGFloat y = height==54?10:20;
    self.headerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, height)];
    self.headerView.backgroundColor = MYTHEMECOLOR;
    [self.view addSubview:self.headerView];
    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(0, height - 0.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = HEX(0xdddddd);
    [self.headerView addSubview:lineView];
    self.lineView = lineView;
    
    //左边button是默认创建的
    self.leftBtnItem =  [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtnItem.frame=CGRectMake(5, y, 44, 44);
    self.leftBtnItem.backgroundColor = [UIColor clearColor];
//    [self.leftBtnItem setTitleColor:nil forState:UIControlStateNormal];
//    self.leftBtnItem.titleLabel.font = XZFont(14.f);
    [self.leftBtnItem setImage:[UIImage imageNamed:@"nav_back"]
                      forState:UIControlStateNormal];
    [self.leftBtnItem addTarget:self action:@selector(leftBtnItemAction:)
               forControlEvents:UIControlEventTouchUpInside];
    //去掉点击高亮效果
    [self.leftBtnItem setAdjustsImageWhenHighlighted:NO];
    [self.headerView addSubview:self.leftBtnItem];

    UIActivityIndicatorView* loadingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((self.view.width - 20)/2, (self.view.height-20)/2, 20.0f, 20.0f)];
    [loadingView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    loadingView.hidden = YES;
    [self.view addSubview:loadingView];
    self.loadingView = loadingView;
    // Do any additional setup after loading the view.
}
//创建标题
-(UILabel*)headerTitle {
    if (!_headerTitle) {
        _headerTitle =  [[UILabel alloc] initWithFrame:CGRectMake(44, self.headerView.height-44,
                                                                  self.headerView.width-88, 44)];
        _headerTitle.backgroundColor = [UIColor clearColor];
//        _headerTitle.font = [XZCommon isLessThanIphone5]?XZFont(16):XZFont(18);
//        _headerTitle.textColor = XZThemeTextColor;
        _headerTitle.textAlignment = NSTextAlignmentCenter;
        [self.headerView addSubview:_headerTitle];
    }
    return _headerTitle;
}

//创建右边button
- (UIButton*)rightBtnItem {
    if (!_rightBtnItem) {
        _rightBtnItem =  [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtnItem.frame=CGRectMake(self.headerView.width-54, self.headerView.height-44,44, 44);
        _rightBtnItem.backgroundColor = [UIColor clearColor];
        [_rightBtnItem addTarget:self action:@selector(rightBtnItemAction:)
                forControlEvents:UIControlEventTouchUpInside];
//        [_rightBtnItem setTitleColor:XZThemeTextColor forState:UIControlStateNormal];
//        _rightBtnItem.titleLabel.font = [XZCommon isLessThanIphone5]?XZFont(14):XZFont(16);
        //去掉点击高亮效果
        [_rightBtnItem setAdjustsImageWhenHighlighted:NO];
        [self.headerView addSubview:_rightBtnItem];
    }
    return _rightBtnItem;
}

-(void)leftBtnItemAction:(UIButton*)btn {
    //返回 关闭键盘
    [self.view endEditing:YES];
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        if ([self respondsToSelector:@selector(presentingViewController)])
            [[self presentingViewController] dismissViewControllerAnimated:YES completion:^{}];
        else
            [[self parentViewController] dismissViewControllerAnimated:YES completion:^{}];
    }
    [SVProgressHUD dismiss];
}

-(void)rightBtnItemAction:(UIButton*)btn {
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [[XZAmrPlayer defaultPlayer] stop];
//    
//    if ([self pageNameForAnalyse]) {
//        [MobClick beginLogPageView:[self pageNameForAnalyse]];
//    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self pageNameForAnalyse]) {
//        [MobClick endLogPageView:[self pageNameForAnalyse]];
    }
}

- (void)hiddenLineView
{
    [self.lineView removeFromSuperview];
}

- (NSString *)pageNameForAnalyse
{
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
