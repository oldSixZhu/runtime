//
//  AppDelegate.h
//  RuntimeCollection
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 OSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

