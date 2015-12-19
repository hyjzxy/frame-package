//
//  MYCommon.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "MYCommon.h"

@implementation MYCommon

+(void)pushViewController:(UIViewController*)vc animate:(BOOL)animated {
    [[[(UINavigationController*)([(UIWindow*)[[UIApplication sharedApplication] windows][0] rootViewController]) viewControllers][0] navigationController] pushViewController:vc animated:animated];
}

+(UIViewController*)pushWithVCClass:(NSString*)className properties:(NSDictionary*)properties {
    id obj = [NSClassFromString(className) new];
    if(NSDictionarySafety(properties)) [obj initializeWithDictionary:properties];
    [MYCommon pushViewController:obj animate:YES];
    return obj;
}

+(void)presentViewController:(UIViewController*)vc animated:(BOOL)animated {
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc
                                                                                 animated:animated
                                                                               completion:nil];
}

+(void)popViewControllerAnimated:(BOOL)animated {
    [[[(UINavigationController*)([(UIWindow*)[[UIApplication sharedApplication] windows][0] rootViewController]) viewControllers][0] navigationController] popViewControllerAnimated:animated];
}

+(BOOL)isLessThanIphone5 {
    return [UIScreen mainScreen].bounds.size.height < 568;
}

@end
