//
//  ViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/2.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//
#import "RotViewController.h"
#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"订餐";
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    double width = self.view.frame.size.width;
    
    [self create_button: width :@selector(order_button_pressed:) :100 :@"帮订餐"];
    [self create_button: width :@selector(look_up_ordered_restaurant:) :150 :@"看订餐"];
}


- (UIButton *)create_button :(double)width :(SEL)btn_pressed :(double)y :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:btn_pressed forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(width/8,y , 3*width/4, 35);
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.cornerRadius = 10.0;
    [self.view addSubview:button];
    return button;
}

-(void)order_button_pressed:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
   
}
    
    


- (void)look_up_ordered_restaurant :(id)sender
{
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];

    
    
    
}

@end
