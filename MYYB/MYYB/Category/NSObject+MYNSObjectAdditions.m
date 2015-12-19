//
//  NSObject+MYNSObjectAdditions.m
//  MYYB
//
//  Created by Gideon on 15/10/28.
//  Copyright © 2015年 Gideon. All rights reserved.
//

#import "NSObject+MYNSObjectAdditions.h"
#import <objc/runtime.h>

@implementation NSObject (MYNSObjectAdditions)

- (void)initializeWithDictionary:(NSDictionary *)item{
    if (!item||![item isKindOfClass:[NSDictionary class]]) {
        return;
    }
    //获取所有property
    [self setClassProperty:[self class] withPropertyDic:item];
    
    if (self.superclass) {
        [self setClassProperty:self.superclass withPropertyDic:item];
    }
}

- (void)setClassProperty:(Class)class withPropertyDic:(NSDictionary*)item{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        
        //        NSLog(@"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%@",propertyName);
        id valueItem = item[propertyName];
        if (valueItem) {
            //获取该property的数据类型
            const char* attries = property_getAttributes(property);
            NSString *attrString = [NSString stringWithUTF8String:attries];
            [self setPropery:attrString value:valueItem propertyName:propertyName];
        }
    }
    free(properties);
}

- (void)resetAllProperty {
    //获取所有property
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        //获取该property的数据类型
        const char* attries = property_getAttributes(property);
        NSString *attrString = [NSString stringWithUTF8String:attries];
        if ([attrString hasPrefix:@"T@"]) {
            [self setValue:nil forKey:propertyName];
        }
    }
    free(properties);
}

- (void)setPropery:(NSString*)attriString
            value:(id)value
     propertyName:(NSString*)propertyName{
    if ([attriString hasPrefix:@"T@\"NSMutableArray\""]) {
        [self setValue:NSMutableArraySafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSArray\""]) {
        [self setValue:NSArraySafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSDictionary\""]) {
        [self setValue:NSDictionarySafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSMutableDictionary\""]) {
        [self setValue:NSMutableDictionarySafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSMutableDictionary\""]) {
        [self setValue:NSMutableDictionarySafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSString\""]) {
        [self setValue:NSStringSafety(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSDate\""]) {
        [self setValue:value forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"AVObject\""]) {
        [self setValue:value forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"AVFile\""]) {
        [self setValue:value forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSIndexPath\""]) {
        [self setValue:value forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSNumber\""]) {
        [self setValue:value forKey:propertyName];
    }
    //bool
    else if ([attriString hasPrefix:@"TB"]) {
        [self setValue:[NSNumber numberWithBool:[value boolValue]] forKey:propertyName];
    }
    //char
    else if ([attriString hasPrefix:@"Tc"]) {
        [self setValue:[NSNumber numberWithBool:[value boolValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Ti"] || [attriString hasPrefix:@"Tq"]) { //Ti是int 和 NSInteger
        if ([propertyName isEqualToString:@"returnKeyType"]) {
            ((UITextField*)self).returnKeyType = [NSStringSafety(value) integerValue];
        }
        else [self setValue:[NSNumber numberWithInteger:[NSStringSafety(value) integerValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Tl"]) { //long
        [self setValue:[NSNumber numberWithLongLong:[NSStringSafety(value) longLongValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Tf"] || [attriString hasPrefix:@"Td"]) { //float
        [self setValue:[NSNumber numberWithFloat:[NSStringSafety(value) floatValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"UIImage\""]) {
        if ([self isKindOfClass:[UIImageView class]]) {
            ((UIImageView*)self).image = [UIImage imageWithContentsOfFile:NSStringSafety(value)];
        }
    }
    else if ([attriString hasPrefix:@"T@\"frame\""]) {
        if ([self isKindOfClass:[UIView class]]) {
            ((UIView*)self).frame = CGRectFromString(NSStringSafety(value));
        }
    }
    else if ([attriString hasPrefix:@"T@\"UIFont\""])  {
        [self setValue:[UIFont fontWithName:NSStringSafety(ObjectForKeySafety(value,@"fontName")) size:[NSStringSafety(ObjectForKeySafety(value,@"fontSize")) floatValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"UIColor\""]) {
        [self setValue:[self buildAttributeColor:NSStringSafety(value)] forKey:propertyName];
    }
}


//设置颜色
- (UIColor*)buildAttributeColor:(NSString*)color{
    UIColor *CGColor;
    if ([color isEqualToString:@"red"]) {
        CGColor = [UIColor redColor];
    }
    else if ([color isEqualToString:@"blue"]) {
        CGColor = [UIColor blueColor];
    }
    else if ([color isEqualToString:@"black"]) {
        CGColor = [UIColor blackColor];
    }
    else if ([color isEqualToString:@"gray"]) {
        CGColor = [UIColor grayColor];
    }
    else if ([color isEqualToString:@"lightGray"]) {
        CGColor = [UIColor lightGrayColor];
    }
    else if ([color isEqualToString:@"darkGray"]) {
        CGColor = [UIColor darkGrayColor];
    }
    else if ([color isEqualToString:@"purple"]) {
        CGColor = [UIColor purpleColor];
    }
    else if ([color isEqualToString:@"orange"]) {
        CGColor = [UIColor orangeColor];
    }
    else if ([color isEqualToString:@"brown"]) {
        CGColor = [UIColor brownColor];
    }
    else if ([color isEqualToString:@"yellow"]) {
        CGColor = [UIColor yellowColor];
    }
    else if ([color isEqualToString:@"green"]) {
        CGColor = [UIColor greenColor];
    }
    else if ([color isEqualToString:@"white"]) {
        CGColor = [UIColor whiteColor];
    }
    else if ([color isEqualToString:@"cyan"]) {
        CGColor = [UIColor cyanColor];
    }
    else if ([color isEqualToString:@"clear"]) {
        CGColor = [UIColor clearColor];
    }
    else {
        CGColor = [self colorWithHexString:color];
    }
    return CGColor;
    
}

- (UIColor*)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])  cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor clearColor];
    
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


- (NSDictionary*)allPropertiestAndValues {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        if ([self valueForKey:propertyName]) {
            [props setObject:[self valueForKey:propertyName] forKey:propertyName];
        }
    }
    free(properties);
    return props;
}

@end
