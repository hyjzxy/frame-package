//
//  AppMacro.h
//  快批口语
//
//  Created by Terry Lin on 15/4/8.
//  Copyright (c) 2015年 XiaoZhan. All rights reserved.
//

#ifndef _____AppMacro_h
#define _____AppMacro_h

#define RGB(r, g, b)  RGBA(r,g,b,1)
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#define XZCheckAndShowLoginScreen   if (![XZCommon checkIsLogin]) {\
[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"XZLoginViewController") alloc] init]] animated:YES completion:nil];\
return;\
}

//#define XZCheckAndShowLoginScreen   if (![XZUser currentUser].isAuthenticated) {\
//[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"XZLoginViewController") alloc] init]] animated:YES completion:nil];\
//return;\
//}

#define XZTabBarCheckAndShowLoginScreen   if (![XZCommon checkIsLogin]) {\
[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"XZLoginViewController") alloc] init]] animated:YES completion:nil];\
return NO;\
}

//#define XZTabBarCheckAndShowLoginScreen   if (![XZUser currentUser].isAuthenticated) {\
//[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"XZLoginViewController") alloc] init]] animated:YES completion:nil];\
//return NO;\
//}


#define XZDisplayError(error) [SVProgressHUD showErrorWithStatus:error.XZDescription];



#ifdef DEBUG
#define DLOG(format, ...)                   \
NSLog(@"\n%s:%d\n%@",               \
__PRETTY_FUNCTION__, __LINE__,      \
[NSString stringWithFormat:format, ## __VA_ARGS__])
#else
#define DLOG(format, ...)
#endif


#endif
