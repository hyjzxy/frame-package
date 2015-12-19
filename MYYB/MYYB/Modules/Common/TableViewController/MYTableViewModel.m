//
//  MYTableViewModel.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYTableViewModel.h"
#import "MYTableViewCell.h"
#import "MYTableViewItem.h"

@implementation MYTableViewModel

-(id)init {
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
        self.itemClass = [MYTableViewItem class];
        self.cellClass = [MYTableViewCell class];
    }
    return self;
}

//请求api接口
-(void)loadDataSource {
    if (!self.api) {
        NSLog(@"请求接口不存在！");
        return;
    }
    __weak typeof(self)weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@&page=%ld",self.api,(long)self.page];
//    [XZHttpRequestService getURL:url parameters:nil completed:^(id result, NSString *error) {
//        if (!error) {
//            [weakSelf handleRequestSuccess:result];
//            //加载完成
//            if (self.loadSuccess) {
//                self.loadSuccess();
//            }
//        }else{
//            if (self.loadFail) {
//                self.loadFail([XZErrorViewManager errorView:error]);
//            }
//        }
//    }];
}

//解析数据
-(void)handleRequestSuccess:(id)result {
    NSArray *datas = NSArraySafety(result);
    //清除之前数据
    if (self.page == 0) {
        [self.dataSource removeAllObjects];
    }
    if (datas.count > 0) {
        for (NSDictionary *dic in datas) {
            //将返回值中的每一组元素变成Item对象，目的是简化代码和数据校验，app不会因为接口数据错误而崩溃
            id item = [self.itemClass new];
            [item initializeWithDictionary:dic];
            [self.dataSource addObject:item];
        }
    }
    //如果总数大于10
    if (datas.count >= 5) {
        self.page += 1;
        self.loadMoreData(YES, NO);
    }else {//如果page等于0，当页不显示“没有更多数据”
        if (self.page == 0) {
            self.loadMoreData(NO,NO);
        }
        else
        {
            self.loadMoreData(NO,YES);
        }
    }
}

@end
