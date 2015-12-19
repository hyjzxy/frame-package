//
//  MYCommon.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYCommon : NSObject
//是否iphone5，屏幕高度判断
+(BOOL)isLessThanIphone5;
//统一调用此方法来push
+ (void)pushViewController:(UIViewController*)vc animate:(BOOL)animate;
//
+(void)presentViewController:(UIViewController*)vc animated:(BOOL)animated;
//push
+(UIViewController*)pushWithVCClass:(NSString*)className properties:(NSDictionary*)properties;
+(void)popViewControllerAnimated:(BOOL)animated;


@end
