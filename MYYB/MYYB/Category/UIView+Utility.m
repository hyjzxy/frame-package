//
//  UIView+Utility.m
//  XiaoZhanToefl
//
//  Created by Terry Lin on 15/1/13.
//  Copyright (c) 2015年 tpooo. All rights reserved.
//

#import "UIView+Utility.h"
#import <objc/runtime.h>

static char *viewClickKey;

@implementation UIView (Utility)
//@dynamic left,top,right,bottom,width,height,centerX,centerY,screenFrame,screenViewX,screenView,screenViewY,screenX,screenY,origin,size;

/******************************设置View左边x坐标*******************************/
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/****************************设置View顶部y坐标*********************************/
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/****************************设置View右边x坐标*********************************/
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

/****************************设置View底部y坐标*************************************/
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

/*****************************设置View的中心坐标********************************/
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

/**************************设置View的宽度***********************************/
- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/*****************************设置View的高度********************************/
- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}






-(void)makeRoundCorner
{
    [self makeRoundCornerWithRadius:4];
}

-(void)makeRoundCornerWithRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
    self.layer.masksToBounds = YES;

}

-(void)becomeRound
{
    self.layer.cornerRadius = MIN(self.width,self.height)/2;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
    self.layer.masksToBounds = YES;
//    self.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.layer.borderWidth = 2;
}


- (UIViewController *)parentViewController {
    UIResponder *responder = self;
    while ([responder isKindOfClass:[UIView class]])
        responder = [responder nextResponder];
    return (UIViewController*)responder;
}

-(void)handleClick:(UIViewClickHandle)handle {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &viewClickKey, handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(void)viewClick {
    UIViewClickHandle callBack = objc_getAssociatedObject(self, &viewClickKey);
    if (callBack!= nil)
    {
        callBack(self);
    }
}

@end
