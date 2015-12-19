//
//  NSObject+MYNSObjectAdditions.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MYNSObjectAdditions)


/**
 *  通过NSDictionary初始化property
 *  为什么要增加这个，目的是避免服务器数据类型错误的问题
 *  @param item
 */
- (void)initializeWithDictionary:(NSDictionary *)item;

/**
 *  重置所有property
 */
- (void)resetAllProperty;

/**
 *  获取当前class的property和value
 */
- (NSDictionary*)allPropertiestAndValues;


- (void)setPropery:(NSString*)attriString
            value:(id)value
     propertyName:(NSString*)propertyName;

//设置颜色
- (UIColor*)buildAttributeColor:(NSString*)color;

@end
