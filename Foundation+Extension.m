//
//  Foundation+Extension.m
//  05-runtime
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <objc/runtime.h>
#import "Foundation+Extension.h"
@implementation NSObject(Extension)
+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(class, otherSelector);
    Method originMehtod = class_getClassMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}
@end

@implementation NSArray(Extension)
+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(by_objectAtIndex:)];
}

- (id)by_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self by_objectAtIndex:index];
    } else {
        return nil;
    }
}

@end

@implementation NSMutableArray(Extension)
+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(addObject:) otherSelector:@selector(by_addObject:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) otherSelector:@selector(by_objectAtIndex:)];
}

- (void)by_addObject:(id)object
{
    if (object != nil) {
        [self by_addObject:object];
    }
}

- (id)by_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self by_objectAtIndex:index];
    } else {
        return nil;
    }
}
@end