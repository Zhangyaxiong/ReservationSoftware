//
//  OrderViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "OrderViewController.h"
#import "ChoosePeopleViewController.h"
#import "ResrveForRestaurant.h"
#import "ChooseCombo.h"
@interface OrderViewController ()

@end

@implementation OrderViewController
- (UILabel *)createLabel :(NSString *)name
{
      double width = self.view.frame.size.width;
//    double height = self.view.frame.size.height;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width/15, 20, 120, 44)];
    label.text = name;
    [self.view addSubview:label];
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
    
}
-(UILabel *)createSelectLabelWithBorder :(NSString *)number
{
    double width = self.view.frame.size.width;
    UILabel *pane = [[UILabel alloc]initWithFrame:CGRectMake(width/15,70, 13*width/15,44)];
    
    
    
    
    pane.text = number;
    
    [self.view addSubview:pane];
    
    
    pane.layer.cornerRadius = 10.0;
    pane.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane.layer.borderWidth = 1;
    
    return pane;
}

- (UILabel *)createLabelWithate :(NSString *)restaurant
{
    double width = self.view.frame.size.width;
    //    double height = self.view.frame.size.height;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width/15, 200, 120, 44)];
    label.text = restaurant;
    [self.view addSubview:label];
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
    
}

-(UILabel *)createSelectLabelWithBordernext :(NSString *)numbernext

{
    double width = self.view.frame.size.width;
    UILabel *pane = [[UILabel alloc]initWithFrame:CGRectMake(width/15,250, 13*width/15,44)];
    pane.text = numbernext;
    [self.view addSubview:pane];
    
    
    pane.layer.cornerRadius = 10.0;
    pane.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane.layer.borderWidth = 1;
    return pane;
}

-(UILabel *)createWithComboEat : (NSString *)combo

{
    double width = self.view.frame.size.width;
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width/15, 370, 120, 44)];
    label.text = combo;
    [self.view addSubview:label];
    label.font = [UIFont boldSystemFontOfSize:18];
    return label;
}

-(UILabel *)createWithBordeThree : (NSString *)numberthree

{
    
    double width = self.view.frame.size.width;
    UILabel *pane1 = [[UILabel alloc]initWithFrame:CGRectMake(width/15,420, 13*width/15,44)];
    pane1.text = numberthree;
    pane1.layer.cornerRadius = 10.0;
    pane1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane1.layer.borderWidth = 1;
    [self.view addSubview:pane1];
    return pane1;
    

}
-(void)getChoosePeopelNotifaction:(NSNotification *)aNotifaction
{
//    选人反馈的通知
    m_nameLabel.text = aNotifaction.object;
}
-(void)getResrveRorRestaurant:(NSNotification *)bNotifaction
{
//选餐厅反馈的通知

    r_resrveLabel.text = bNotifaction.object;
}
-(void)getChooseCobmoNotifaction:(NSNotification *)cNotifaction
{
//    选套餐反馈的通知
    c_cobmoLabel.text = cNotifaction.object;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    通知函数
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getChoosePeopelNotifaction:) name:@"notfactionName" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getResrveRorRestaurant:) name:@"notfactionReare" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector (getChooseCobmoNotifaction:)name:@"notfactionCobmo" object:nil];
    
    self.navigationItem.title = @"看订餐";
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
   
    
    // Do any additional setup after loading the view.
    
    [self createLabel:@"人："];
    m_nameLabel = [self createSelectLabelWithBorder :@""];
    [self createLabelWithate:@"餐厅："];
    r_resrveLabel = [self createSelectLabelWithBordernext:@""];
    [self createWithComboEat:@"套餐:"];
    c_cobmoLabel = [self createWithBordeThree:@""];
//    按钮‘选人’
    UIButton *candidates = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    double width = self.view.frame.size.width;
    candidates.frame = CGRectMake(width/15,140, 13*width/15,44);
    
    [candidates setTitle:@"选人" forState:UIControlStateNormal];
    candidates.layer.cornerRadius = 10.0f;
    candidates.layer.borderWidth = 1.0;
    candidates.layer.borderColor = [UIColor lightGrayColor].CGColor;
    candidates.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1];
    candidates.layer.masksToBounds = YES;
    [self.view addSubview:candidates];
//   ” 固定的“
    [candidates addTarget:self action:@selector(choosePeopleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//   返回button‘s及text.
    
    UIBarButtonItem *backItemReservationEat = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItemReservationEat.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItemReservationEat];
    

       
    
//    按钮'选餐厅'
    UIButton *restaurant = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    restaurant.frame = CGRectMake(width/15,320, 13*width/15,44);
    
    [restaurant setTitle:@"选餐厅" forState:UIControlStateNormal];
    restaurant.layer.cornerRadius = 10.0f;
    restaurant.layer.borderWidth = 1.0;
    restaurant.layer.borderColor = [UIColor lightGrayColor].CGColor;
    restaurant.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1];
    restaurant.layer.masksToBounds = YES;
    [self.view addSubview:restaurant];
//    push到另外一个页面"固定用法"
    [restaurant addTarget:self action:@selector(ResrveForRestaurantButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
//   按钮“选套餐”
    UIButton *chooseEat = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
   chooseEat.frame = CGRectMake(width/15,470, 13*width/15,44);
    
    [chooseEat setTitle:@"选套餐" forState:UIControlStateNormal];
     chooseEat.layer.cornerRadius = 10.0f;
     chooseEat.layer.borderWidth = 1.0;
     chooseEat.layer.borderColor = [UIColor lightGrayColor].CGColor;
     chooseEat.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];
     chooseEat.layer.masksToBounds = YES;
    [self.view addSubview:chooseEat];
    
    [chooseEat addTarget:self action:@selector(ChooseCobmoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];


   
//    确定按钮
    
    UIButton *ensure = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    ensure.frame = CGRectMake(width/15,520, 13*width/15,44);
    
    [ensure setTitle:@"确定" forState:UIControlStateNormal];
    ensure.layer.cornerRadius = 10.0f;
    ensure.layer.borderWidth = 1.0;
    ensure.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ensure.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];
    ensure.layer.masksToBounds = YES;
    [self.view addSubview:ensure];

}
//设置了一个选人按钮寄主。
-(void)choosePeopleButtonPressed:(id)sender
{
    ChoosePeopleViewController *choosePeople = [[ChoosePeopleViewController alloc]init];
    [self.navigationController pushViewController:choosePeople animated:YES];

}
-(void)ResrveForRestaurantButtonPressed:(id)senderForChooseRestaurant
{
    ResrveForRestaurant *ChooseRestaurant = [[ResrveForRestaurant alloc]init];
    [self.navigationController pushViewController:ChooseRestaurant animated:YES];
}
-(void)ChooseCobmoButtonPressed:(id)senderForChooseCobmo
{
    ChooseCombo *ChooseCobmo = [[ChooseCombo alloc]init];
    [self.navigationController pushViewController:ChooseCobmo animated:YES];
}
@end

