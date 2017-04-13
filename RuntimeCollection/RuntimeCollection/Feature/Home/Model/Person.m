//
//  Person.m
//  runtime
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 DGJD. All rights reserved.
//

#import "Person.h"


@implementation Person

@dynamic  something;

-(NSString *)something
{
    return _something;
}
-(void)setSomething:(NSString *)something
{
    _something = something;

}


//正常字典转模型
+(instancetype)OSZModelWithDicNormal:(NSDictionary *)dic
{
    Person *model = [[Person alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

//重写防止没有该属性名时报错"this class is not key value coding-compliant for the key"
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

//奇葩字典转模型
+(instancetype)OSZModelWithDicQiPa:(NSDictionary *)dic
{
    Person *model = [[Person alloc]init];
    model.name = dic[@"name"];
    model.age = dic[@"age"];
    model.height = dic[@"height"];
    return model;
}

@end
