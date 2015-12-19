//
//  MYTableViewController.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYTableViewController.h"
#import "MYTableViewCell.h"
#import "MYTableViewItem.h"

@interface MYTableViewController ()

@end

@implementation MYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.headerView.bottom, self.view.width, self.view.height - self.navigationController.navigationBar.height - self.tabBarController.tabBar.height - 20) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
    self.tableView.backgroundColor = [UIColor clearColor];
    //去掉分隔符
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //初始化刷新图片
    
    [self.view addSubview:self.tableView];
}

- (MYTableViewModel*)viewModel{
    if (!_viewModel) {
        self.viewModel = [[MYTableViewModel alloc] init];
//        @weakify(self)
//        self.viewModel.loadSuccess = ^{
//            @strongify(self)
//            [self.loadingView stopAnimating];
//            [self.tableView.header endRefreshing];
//            [self.tableView reloadData];
//            //如果总数大于10
//            if (self.viewModel.dataSource.count >= 10 && !self.tableView.footer) {
//                //加载底部上拉刷新
//                self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
//            }
//        };
//        self.viewModel.loadFail = ^(UIView* errorView){
//            @strongify(self)
//            [self.loadingView stopAnimating];
//            [self.tableView.header endRefreshing];
//            [self.tableView reloadData];
//            
//        };
//        self.viewModel.loadMoreData = ^(BOOL moreData, BOOL showFootor){
//            @strongify(self)
//            //是否提示“没有更多数据”
//            if (showFootor) {
//                [self.tableView.footer endRefreshingWithNoMoreData];
//            }
//            else
//            {
//                [self.tableView.footer resetNoMoreData];
//            }
//        };
    }
    return _viewModel;
}

//请求api接口
-(void)loadDataSource {
    [self.viewModel loadDataSource];
}

//上拉加载更多
- (void)loadMore
{
    [self loadDataSource];
}

//重新下拉刷新
- (void)reloadData
{
    self.viewModel.page = 0;
    [self loadDataSource];
}

#pragma mark - scrollViewDelegate

//下拉刷新动画下拉放大至1倍
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat y = scrollView.contentOffset.y;
//    if (y < 0) {
//        y = fabs(y);
//        if (self.tableView.header.subviews.count > 0) {
//            for (NSInteger i = 0; i < self.tableView.header.subviews.count; i++) {
//                if ([self.tableView.header.subviews[i] isKindOfClass:[UIImageView class]]) {
//                    if (y >= self.refreshImage.size.height) {
//                        y = self.refreshImage.size.height;
//                    }
//                    self.tableView.header.subviews[i].transform = CGAffineTransformMakeScale(y/self.refreshImage.size.height, y/self.refreshImage.size.height);
//                }
//            }
//        }
//    }
//}

#pragma mark - UITableViewDataSource

//每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.viewModel.dataSource.count > 0) {
        return ((MYTableViewItem*)(self.viewModel.dataSource[indexPath.row])).cellHeight;
    }
    else
    {
        return 44.f;
    }
}

//有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.dataSource count];
}

//每一行的界面
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indetify = @"Cell";
    //使用自定义的cell
    id cell = [tableView dequeueReusableCellWithIdentifier:indetify];
    
    if (!cell) {
        cell = [[self.viewModel.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetify];
    }
    ((MYTableViewCell*)cell).indexPath = indexPath;
    ((MYTableViewCell*)cell).item = ObjectIndexSafety(self.viewModel.dataSource, indexPath.row);
    
    return cell;
}

//点击某一行触发的事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取到点击的是那一行
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}

#pragma mark -
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![self.viewModel.dataSource count]>0 || self.isUpdateViewFlag) {
        self.isUpdateViewFlag = NO;
        [self loadDataSource];
    }
}


@end
