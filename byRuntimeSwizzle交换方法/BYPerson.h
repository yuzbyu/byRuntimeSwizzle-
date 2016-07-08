//
//  BYPerson.h
//  byRuntimeSwizzle交换方法
//
//  Created by By on 16/6/22.
//  Copyright © 2016年 xinyisheying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYPerson : NSObject<NSCoding>
/**<#注释#>*/
@property (nonatomic, assign) int age;
/**<#注释#>*/
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) double height;

- (void)run;
@end
