//
//  OSZHomeViewController.m
//  RuntimeCollection
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 OSZ. All rights reserved.
//

#import "OSZHomeViewController.h"
#import "Person.h"

@interface OSZHomeViewController ()

@end

@implementation OSZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    [self modelTest1];
    
}

-(void)modelTest1{
    NSDictionary *dic = @{
                          @"name":@"张三",
                          @"age":@22,
                          @"height":@170,
                          @"weight":@60
                          };
    //    正常
    //    Person *p = [Person OSZModelWithDicNormal:dic];
    //    奇葩
    //    Person *p = [Person OSZModelWithDicQiPa:dic];
    //    第三方
//    Person *p = [Person yy_modelWithDictionary:dic];
    //    runtime
        Person *p = [Person OSZModelWithDicRuntime:dic];
    
    NSLog(@"%@,%@,%@",p.name,p.age,p.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
