//
//  MYTableViewModel.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MYTableViewModelSuccess)();                                   //请求成功
typedef void(^MYTableViewModelFail)(UIView  *failView);                     //返回错误界面
typedef void(^MYTableViewModelEmpty)();                                     //返回无数据界面，page=0的时候触发
typedef void(^MYTableViewModelMoreData)(BOOL moreData,BOOL showFootor);     //是否还有更多数据

@interface MYTableViewModel : NSObject

/**
 *  接口地址
 */
@property (nonatomic,strong) NSString*                          api;
/**
 *  当前第几页
 */
@property (nonatomic,assign) NSInteger                          page;
/**
 *  请求参数
 */
@property (nonatomic,strong) NSDictionary*                      postDic;
/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray*                    dataSource;
/**
 *  item的class
 */
@property (nonatomic,strong) Class                              itemClass;
/**
 *  cell的class
 */
@property (nonatomic,strong) Class                              cellClass;
/**
 *  获取数据成功
 */
@property (nonatomic,copy)  MYTableViewModelSuccess             loadSuccess;
/**
 *  获取数据失败
 */
@property (nonatomic,copy)  MYTableViewModelFail                loadFail;
/**
 *  没有更多数据
 */
@property (nonatomic,copy)  MYTableViewModelMoreData            loadMoreData;
/**
 *  请求数据
 */
-(void)loadDataSource;
/**
 *  处理返回数据
 *
 *  @param result array 或 dictionary
 */
-(void)handleRequestSuccess:(id)result;

@end
