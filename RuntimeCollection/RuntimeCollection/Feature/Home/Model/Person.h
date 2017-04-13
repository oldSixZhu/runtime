//
//  Person.h
//  runtime
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 DGJD. All rights reserved.
//  person模型类

#import <Foundation/Foundation.h>
#import "NSObject+modelTransform.h"

@interface Person : NSObject
{
    NSString *_something;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, copy) NSString *something;

//正常字典转模型
+(instancetype)OSZModelWithDicNormal:(NSDictionary *)dic;

//奇葩字典转模型
+(instancetype)OSZModelWithDicQiPa:(NSDictionary *)dic;

@end
