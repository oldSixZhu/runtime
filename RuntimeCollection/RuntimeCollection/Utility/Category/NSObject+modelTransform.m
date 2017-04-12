//
//  NSObject+modelTransform.m
//  runtime
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 DGJD. All rights reserved.
//

#import "NSObject+modelTransform.h"
#import <objc/runtime.h>

@implementation NSObject (modelTransform)

+ (NSArray *)propertyList
{
    //1.获取该类属性,返回值是所有属性的数组
    /* 成员变量:
     * class_copyIvarList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 方法:
     * class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 属性:
     * class_copyPropertyList(__unsafe_unretained Class cls, unsigned int *outCount)
     * 协议:
     * class_copyProtocolList(__unsafe_unretained Class cls, unsigned int *outCount)
     */
    /**
     * 参数1: 要获取的类
     * 参数2: 类属性的个数指针
     * 返回值: 所有属性的数组, C 语言中,数组的名字,就是指向第一个元素的地址
     */
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    //2.把C的属性数组转换成OC的属性数组
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [[NSString alloc]initWithUTF8String:cName];
        [arr addObject:name];
    }
    //c的函数注意手动管理内存
    free(propertyList);
    return arr.copy;
}


+ (instancetype)OSZModelWithDicRuntime:(NSDictionary *)dic
{
    id obj = [self new];
    //遍历属性数组
    for (NSString *property in [self propertyList])
    {
        //如果字典中有相同的key,就转换成模型
        if (dic[property])
        {
            [obj setValue:dic[property] forKey:property];
        }
    }
    return obj;
}

@end
/*
 1:当只是遍历NSArray的时候使用For-in会比较快速, 推荐使用For-in遍历数组.
 
 2:当我们想遍历NSDictionary的时候, 推荐使用enumerateKeysAndObjectsUsingBlock
 
 不仅仅是因为速度快, 更是因为代码更优雅和直观
 

id objc = [[self alloc]init];
//1. 获得当前类的属性列表
NSArray *propertyList = [self  transform];
//2. 遍历字典
[dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
     //3. 如果key在属性列表中 可以使用 KVC 设置数值
    if ([propertyList containsObject:key])
    {
        [objc setValue:obj forKey:key];
    }
}];

*/
