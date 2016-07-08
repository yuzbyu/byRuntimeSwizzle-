//
//  BYPerson.m
//  byRuntimeSwizzle交换方法
//
//  Created by By on 16/6/22.
//  Copyright © 2016年 xinyisheying. All rights reserved.
//

#import "BYPerson.h"
#import <objc/runtime.h>
@implementation BYPerson
-(void)run{
    NSLog(@"run-------by");
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([BYPerson class], &count);//注意数据类型,不是count
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];  //注意数据类型,不是 Ivar *ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
        
    }
}
@end
