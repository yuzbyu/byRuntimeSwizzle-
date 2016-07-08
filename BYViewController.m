//
//  BYViewController.m
//  byRuntimeSwizzle交换方法
//
//  Created by By on 16/6/22.
//  Copyright © 2016年 xinyisheying. All rights reserved.
//

#import "BYViewController.h"
#import <objc/runtime.h>
#import "BYPerson.h"
#import <objc/message.h>

@interface BYViewController ()
@property (nonatomic, strong) NSMutableArray *names;
@property (nonatomic, strong) NSArray *books;

@end

@implementation BYViewController

- (NSMutableArray *)names
{
    if (_names == nil) {
        self.names = [NSMutableArray array];
    }
    return _names;
}



- (void)addName:(NSString *)name
{
    [self.names addObject:name];
}//如果这是老项目,现在新项目要做一个判断,根据版本号来用不同一二套图标,如果是ios7以后用二张vip,如果不是,那用publish-a  和publish-v
//如果所有的地方都要这样来换,那太累了,太麻烦了,想着说,重写原来的方法,在里面加判断
//想达到这样的效果,就要用到runtime


-(void)viewDidLoad
{
    [super viewDidLoad];
     self.imag1.image = [UIImage imageNamed:@"vip"];
     self.image2.image = [UIImage imageNamed:@"vip1"];
    
    
    //    NSDictionary *info = @{@"name" : @"jack", @"age" : @10};
    //
    //    NSString *key = nil;
    //
    //    NSLog(@"%@", info[key]);
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    info[@"name"] = nil;
    
        self.books = @[@"kiuhua", @"xxx"];
    
        NSLog(@"%@", self.books[4]);
    
    //    [self addName:@"jack"];
    //    [self addName:@"rose"];
    //    [self addName:@"jim"];
    //
    //    NSLog(@"%@", self.names[4]);
    //    NSLog(@"%@", [self.names objectAtIndex:4]);
    
}
//- (void)iOSSwizzle{
////     什么是iOS Swizzle？利用运行时函数交换2个方法的实现
//    
//        BOOL iOS7 = [[UIDevice currentDevice].systemVersion floatValue] >= 7.0;
//        if (iOS7) {
//            self.imag1.image = [UIImage imageNamed:@"publish-audio"];
//            self.imag1.image = [UIImage imageNamed:@"publish-video"];
//        } else {
//            self.image2.image = [UIImage imageNamed:@"vip"];
//            self.image2.image = [UIImage imageNamed:@"avatar_vip"];
//        }
//
//}


- (void)testRuntimeIvar
{
    // Ivar : 成员变量!!!!!
    unsigned int count = 0;
    // 获得所有的成员变量
    Ivar *ivars = class_copyIvarList([BYPerson  class], &count);
    for (int i = 0; i<count; i++) {
        // 取得i位置的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"%d %s %s", i, name, type);
    }
    
    //    BYPerson *p = [[BYPerson alloc] init];
    //    objc_msgSend(p, @selector(setAge:), 20);
    
    //    NSLog(@"%d", p.age);
}


@end
