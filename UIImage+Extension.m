//
//  UIImage+Extension.m
//  byRuntimeSwizzle交换方法
//
//  Created by By on 16/6/22.
//  Copyright © 2016年 xinyisheying. All rights reserved.
//

#import "UIImage+Extension.h"
#import <objc/runtime.h>
@implementation UIImage (Extension)
+ (void)load{
    Method otherMethod = class_getClassMethod(self, @selector(imageWithName:));
    Method originMethod = class_getClassMethod(self, @selector(imageNamed:));
    //交换二个方法的实现
    method_exchangeImplementations(otherMethod, originMethod);
    
}

+ (UIImage *)imageWithName:(NSString *)name{
    BOOL iOS7 = [[UIDevice currentDevice].systemVersion  floatValue] >= 7.0;
    
    UIImage *image = nil;
    
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageWithName:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageWithName:name];
    }
    return image;
}
@end
