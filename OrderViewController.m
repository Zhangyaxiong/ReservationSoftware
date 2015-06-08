//
//  OrderViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController
- (UILabel *)createLabel :(NSString *)name
{
      double width = self.view.frame.size.width;
//    double height = self.view.frame.size.height;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width/15, 100, 120, 44)];
    label.text = name;
    [self.view addSubview:label];
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
    
}
-(UILabel *)createSelectLabelWithBorder :(NSString *)number
{
    double width = self.view.frame.size.width;
    UILabel *pane = [[UILabel alloc]initWithFrame:CGRectMake(width/15,150, 13*width/15,44)];
    pane.text = number;
    [self.view addSubview:pane];
    
    
    pane.layer.cornerRadius = 10.0;
    pane.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane.layer.borderWidth = 1;
    return pane;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLabel:@"人："];
    [self createSelectLabelWithBorder :@"                              "];
    
}

@end

