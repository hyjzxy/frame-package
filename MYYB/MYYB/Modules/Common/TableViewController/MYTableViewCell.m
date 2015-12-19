//
//  MYTableViewCell.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYTableViewCell.h"

@interface MYTableViewCell ()
{
    //是否取消长按
    BOOL            cancelLongPressFlag;
}

@end

@implementation MYTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //自定义选中颜色
        //初始化点击背景效果图
        UIView* selectedbgView = [UIView newAutoLayoutView];
        selectedbgView.layer.cornerRadius = 5.f;
        selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0];
        self.selectedbgView = selectedbgView;
        //添加单击
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [selectedbgView addGestureRecognizer:tap];
        //添加长按手势
        UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longpress:)];
        longpress.numberOfTouchesRequired = 1;
        longpress.minimumPressDuration = 0.1f;
        [selectedbgView addGestureRecognizer:longpress];
    }
    return self;
}

- (void)click:(id)sender
{
    self.selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.25f];
//    XZCheckAndShowLoginScreen
    //跳转
    [MYCommon pushWithVCClass:self.vcClassName properties:self.properties];
}

- (void)deselect
{
    //pop返回table时，cell自动取消选中状态
    self.selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0];
}

//长按
- (void)longpress:(UILongPressGestureRecognizer*)ges
{
    if (ges.state == UIGestureRecognizerStateBegan) {
        self.selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
    }
    //长按结束，触发跳转事件
    if (ges.state == UIGestureRecognizerStateEnded) {
        if (!cancelLongPressFlag) {
            //长按结束才跳转，长按结束不跳转
            self.selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0];
//            XZCheckAndShowLoginScreen
            [self click:nil];
        }
        cancelLongPressFlag = NO;
    }
    //长按取消
    if (ges.state == UIGestureRecognizerStateChanged) {
        self.selectedbgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0];
        //设置长按取消tag
        cancelLongPressFlag = YES;
    }
}

@end
