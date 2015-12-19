//
//  MYBaseViewController.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYBaseViewController : UIViewController

//顶栏View
@property (nonatomic,strong) UIView*        headerView;
//顶栏的标题
@property (nonatomic,strong) UILabel*       headerTitle;
//左边按钮
@property (nonatomic,strong) UIButton*      leftBtnItem;
//右边按钮
@property (nonatomic,strong) UIButton*      rightBtnItem;
@property (nonatomic,assign) BOOL          didSetupConstraints;
@property (nonatomic,strong) UIActivityIndicatorView*       loadingView;

//左边按钮事件，默认是返回
- (void)leftBtnItemAction:(UIButton*)btn;
//右边按钮事件，无默认
- (void)rightBtnItemAction:(UIButton*)btn;

- (NSString *)pageNameForAnalyse;

- (void)hiddenLineView;

@end
