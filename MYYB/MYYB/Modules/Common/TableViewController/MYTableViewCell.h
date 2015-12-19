//
//  MYTableViewCell.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYTableViewItem.h"

@interface MYTableViewCell : UITableViewCell

//点击背景效果图
@property (nonatomic,strong) UIView*                    selectedbgView;
@property (nonatomic,strong) NSIndexPath*               indexPath;
@property (nonatomic,strong) MYTableViewItem*           item;
@property (nonatomic,strong) NSString*                  vcClassName;
@property (nonatomic,strong) NSDictionary*              properties;
//点击事件
- (void)click:(id)sender;
//长按事件
- (void)longpress:(UILongPressGestureRecognizer*)sender;

@end
