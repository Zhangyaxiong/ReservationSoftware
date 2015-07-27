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

    m_resrveLabel.text = bNotifaction.object;
}
-(void)getChooseCobmoNotifaction:(NSNotification *)cNotifaction
{
    NSDictionary *dicCobmo = cNotifaction.object;
//    选套餐反馈的通知
    m_cobmoLabel.text = [dicCobmo objectForKey:@"name"];
    m_strprice = [dicCobmo objectForKey:@"price"];
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
   
    
    // Do any additional setup after loading the view. 通知按钮指针push过程。
    
    [self createLabel:@"人："];
    m_nameLabel = [self createSelectLabelWithBorder :@""];
    [self createLabelWithate:@"餐厅："];
    m_resrveLabel = [self createSelectLabelWithBordernext:@""];
    [self createWithComboEat:@"套餐:"];
    m_cobmoLabel = [self createWithBordeThree:@""];
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
//    33333333
    NSArray *arrPeopele = [[NSArray alloc]initWithObjects:@"KFC",@"MDL",@"星巴克", nil];
    
    m_dicResrveLabel = [[NSDictionary alloc]initWithObjectsAndKeys:arrPeopele,@"许嵩",arrPeopele,@"周杰伦",arrPeopele,@"梁静茹",arrPeopele,@"许飞",nil];
    
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
//  11111111111111111
 
    NSDictionary *dicKFC1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"超值多人餐",@"name",@"20",@"price",@"￥",@"money",nil];
    NSDictionary *dicKFC2= [[NSDictionary alloc]initWithObjectsAndKeys:@"美味汉堡",@"name",@"11",@"price",@"￥",@"money", nil];
    NSArray *arrKFC = [[NSArray alloc]initWithObjects:dicKFC1,dicKFC2,nil];
    
    
  
    NSDictionary *dicMDL1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"脆香油条",@"name",@"10",@"price",@"￥",@"money", nil];
    NSDictionary *dicMDL2 =[[NSDictionary alloc]initWithObjectsAndKeys:@"圣代",@"name",@"8",@"price",@"￥",@"money",nil];
    NSArray *arrMDL = [[NSArray alloc]initWithObjects:dicMDL1,dicMDL2 ,nil];

  
    
  
    
    NSDictionary *dicXbk1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"奶茶",@"name",@"8",@"price",@"￥",@"money", nil];
    NSDictionary *dicXbk2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"胜利茶",@"name",@"12",@"price",@"￥",@"money",nil];
    NSArray *arrXbc =[[NSArray alloc]initWithObjects:dicXbk1,dicXbk2,nil];
    
    

    m_dicComboData =[[NSDictionary alloc]initWithObjectsAndKeys:arrKFC,@"KFC",arrMDL,@"MDL",arrXbc,@"星巴克",nil];

    
//    确定按钮
    
    UIButton *ensure = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    ensure.frame = CGRectMake(width/15,520, 13*width/15,44);
    
    [ensure setTitle:@"确定" forState:UIControlStateNormal];
    
    [ensure addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventTouchUpInside];
    ensure.layer.cornerRadius = 10.0f;
    ensure.layer.borderWidth = 1.0;
    ensure.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ensure.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];
    
    ensure.layer.masksToBounds = YES;
    
    
   
   
    [self.view addSubview:ensure];
    
    
}
-(void)showAlertView :(id)sender
{
    if(![m_nameLabel.text isEqualToString: @""] && ![m_resrveLabel.text  isEqualToString: @""] && ![m_cobmoLabel.text  isEqualToString: @""]&&![N_nameLabel.text isEqualToString:@""])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //获取沙盒中Documents文件的路径
        NSString *str_file_path = [paths objectAtIndex:0];
        //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
        NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:@"order.plist"];
        //        初始化字典
        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:m_nameLabel.text,@"name",m_resrveLabel.text,@"restaurant",m_cobmoLabel.text,@"combo",m_strprice,@"price",N_nameLabel.text,@"noName",nil];
        
        //     zhi xing zhe lu jing
        NSMutableArray *array_order = [[NSMutableArray alloc]initWithContentsOfFile:str_data_file_path];
        if (array_order == nil)
        {
            array_order = [[NSMutableArray alloc]initWithCapacity:0];
        }
    
        [array_order addObject:dic];
        BOOL is_save_success = [array_order writeToFile:str_data_file_path atomically:YES];
        if (is_save_success == true)
        {
            [(UIButton *)sender setEnabled:NO];
            
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示信息" message:@"用户输入不完整，订餐失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    
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
   
//  字典要显示的内容根。
    
    NSArray *cobomArray = [m_dicComboData objectForKey:m_resrveLabel.text];

    ChooseCombo *chooseCobmo = [[ChooseCombo alloc]initWithDataArray:cobomArray];
    
    [self.navigationController pushViewController:chooseCobmo animated:YES];

}

@end

