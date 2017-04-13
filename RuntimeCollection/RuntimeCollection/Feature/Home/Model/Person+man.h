//
//  Person+man.h
//  RuntimeCollection
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 OSZ. All rights reserved.
//

#import "Person.h"

//添加协议
@protocol ManProtocol <NSObject>

@property (nonatomic, strong) NSNumber *weight1;

@end

@interface Person (man)<ManProtocol>
//{
//    NSNumber *_weight;
//}

@property (nonatomic, strong) NSNumber *weight;


@end
