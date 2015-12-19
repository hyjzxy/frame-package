//
//  UIView+Utility.h
//  XiaoZhanToefl
//
//  Created by Terry Lin on 15/1/13.
//  Copyright (c) 2015年 tpooo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIViewClickHandle)(UIView *view);

@interface UIView (Utility)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;

@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

//@property(nonatomic,readonly) CGFloat screenX;
//@property(nonatomic,readonly) CGFloat screenY;
//@property(nonatomic,assign,readonly) CGFloat screenViewX;
//@property(nonatomic,readonly) CGFloat screenViewY;
//@property(nonatomic,readonly) CGRect screenFrame;

//@property(nonatomic,assign) CGPoint origin;
//@property(nonatomic) CGSize size;



-(void)makeRoundCorner;
-(void)makeRoundCornerWithRadius:(CGFloat)radius;
-(void)becomeRound;
- (UIViewController *)parentViewController;

- (void)handleClick:(UIViewClickHandle)handle;

@end
