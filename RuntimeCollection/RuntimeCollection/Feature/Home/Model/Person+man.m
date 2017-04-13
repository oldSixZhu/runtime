//
//  Person+man.m
//  RuntimeCollection
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 OSZ. All rights reserved.
//

#import "Person+man.h"
#import <objc/runtime.h>

@implementation Person (man)

/*
 @property有两个对应的词，一个是@synthesize，一个是@dynamic。如果@synthesize和@dynamic都没写，那么默认的就是@syntheszie var = _var;
 
 @synthesize的语义是如果你没有手动实现setter方法和getter方法，那么编译器会自动为你加上这两个方法。
 
 @dynamic告诉编译器,属性的setter与getter方法由用户自己实现，不自动生成。（当然对于readonly的属性只需提供getter即可）。假如一个属性被声明为@dynamic var，然后你没有提供@setter方法和@getter方法，编译的时候没问题，但是当程序运行到instance.var =someVar，由于缺setter方法会导致程序崩溃；或者当运行到 someVar = var时，由于缺getter方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
 */
@dynamic weight1;
@dynamic weight;

//-(NSNumber *)weight
//{
//    return _weight;
//}
//-(void)setWeight:(NSNumber *)weight
//{
//    _weight = weight;
//}

//定义常量 必须是C语言字符串
static char *PersonPropertyKey = "PersonPropertyKey";
-(void)setWeight:(NSNumber *)weight{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, PersonPropertyKey, weight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)weight{
    return objc_getAssociatedObject(self, PersonPropertyKey);
}


@end
