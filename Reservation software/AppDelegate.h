//
//  AppDelegate.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/2.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//视图
@property (strong, nonatomic) ViewController *viewController;
//导航
@property (strong, nonatomic) UINavigationController *navController;

@end

