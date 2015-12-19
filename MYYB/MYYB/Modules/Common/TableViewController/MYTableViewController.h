//
//  MYTableViewController.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYBaseViewController.h"
#import "MYTableViewModel.h"

typedef void (^MYLoadSuccessHandler)();

@interface MYTableViewController : MYBaseViewController<UITableViewDelegate, UITableViewDataSource>
/**
 *  table
 */
@property (nonatomic,strong) UITableView*                       tableView;
/**
 *  model
 */
@property (nonatomic,strong) MYTableViewModel*                  viewModel;
/**
 * 重新进入需不需要刷新
 */
@property (nonatomic,assign) BOOL                               isUpdateViewFlag;

/**
 *  加载数据
 */
-(void)loadDataSource;

@end
