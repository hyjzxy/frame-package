//
//  MYHomePageViewController.m
//  MYYB
//
//  Created by Gideon on 15/10/29.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYHomePageViewController.h"

@interface MYHomePageViewController ()

@end

@implementation MYHomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.leftBtnItem setImage:[UIImage imageNamed:@"home_user"] forState:UIControlStateNormal];
    self.leftBtnItem.width = 40;
    self.leftBtnItem.height = 40;
    self.leftBtnItem.left = 15;
    self.leftBtnItem.top = 20;
    
    [self.rightBtnItem setImage:[UIImage imageNamed:@"home_share"] forState:UIControlStateNormal];
    self.rightBtnItem.width = 40;
    self.rightBtnItem.height = 40;
    self.rightBtnItem.right = SCREEN_WIDTH - 15;
    self.rightBtnItem.top = 20;
    
}

@end
