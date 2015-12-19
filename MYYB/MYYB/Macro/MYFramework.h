//
//  MYFramework.h
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#ifndef MYFramework_h
#define MYFramework_h

#define NSStringSafety(obj) \
[obj isKindOfClass:[NSObject class]]?[NSString stringWithFormat:@"%@",obj]:@""

#define NSArraySafety(obj) \
[obj isKindOfClass:[NSArray class]]?obj:nil

#define NSDictionarySafety(obj) \
[obj isKindOfClass:[NSDictionary class]]?obj:nil

#define ObjectForKeySafety(obj,key) \
[obj isKindOfClass:[NSDictionary class]]?[obj objectForKey:key]:nil


#define ObjectIndexSafety(obj,index) \
[obj isKindOfClass:[NSArray class]]&&index<[obj count] ? [obj objectAtIndex:index] :nil


#define NSMutableArraySafety(obj)  \
[obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]] ? [NSMutableArray arrayWithArray:obj] :nil

#define NSMutableDictionarySafety(obj)  \
[obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSMutableDictionary class]] ? [NSMutableDictionary dictionaryWithDictionary:obj] : nil

#import "NSObject+MYNSObjectAdditions.h"
#import "UIView+Utility.h"

#endif /* MYFramework_h */
