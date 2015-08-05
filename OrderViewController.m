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

-(UILabel *)createLabelWithText : (NSString *)labelText :(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:label];
    return label;
}


-(UILabel *)createSelectLabelWithBorder :(CGRect)frame
 {
    UILabel *pane = [[UILabel alloc]initWithFrame:frame];
    pane.text = @"";
    [self.view addSubview:pane];
    pane.layer.cornerRadius = 10.0;
    pane.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane.layer.borderWidth = 1;
    return pane;
 }

-(void)getChoosePeopelNotifaction:(NSNotification *)aNotifaction
 {
 // 选人反馈的通知
    m_nameLabel.text = aNotifaction.object;
  }
-(void)getResrveRorRestaurant:(NSNotification *)bNotifaction
 {
// 选餐厅反馈的通知
    m_resrveLabel.text = bNotifaction.object;
 }
-(void)getChooseCobmoNotifaction:(NSNotification *)cNotifaction
 {
     NSDictionary *dicCobmo = cNotifaction.object;
// 选套餐反馈的通知
    m_cobmoLabel.text = [dicCobmo objectForKey:@"name"];
    m_strprice = [dicCobmo objectForKey:@"price"];
 }
-(void)create_Label_frame_button
{
    double width = self.view.frame.size.width;
    [self createLabelWithText:@"人：" :CGRectMake(width/15, 20, 120, 44)];
    [self createLabelWithText:@"餐厅：" :CGRectMake(width/15, 200, 120, 44)];
    [self createLabelWithText:@"套餐:" :CGRectMake(width/15, 370, 120, 44)];
    m_nameLabel = [self createSelectLabelWithBorder :CGRectMake(width/15,70, 13*width/15,44)];
    m_resrveLabel = [self createSelectLabelWithBorder:CGRectMake(width/15, 250, 13*width/15, 44)];
    m_cobmoLabel = [self createSelectLabelWithBorder:CGRectMake(width/15,420, 13*width/15,44)];
    [self create_button_with_frame];
}
- (void)create_button_with_frame
{
    double width = self.view.frame.size.width;
    [self create_button_with_frame:CGRectMake(width/15,140, 13*width/15,44) :@"选人" :@selector(choosePeopleButtonPressed:)];
    UIBarButtonItem *backItemReservationEat = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItemReservationEat.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItemReservationEat];
    [self create_button_with_frame:CGRectMake(width/15,320, 13*width/15,44) :@"选餐厅" :@selector(ResrveForRestaurantButtonPressed:)];
    NSArray *arrPeopele = [[NSArray alloc]initWithObjects:@"KFC",@"MDL",@"星巴克", nil];
    m_dicResrveLabel = [[NSDictionary alloc]initWithObjectsAndKeys:arrPeopele,@"许嵩",arrPeopele,@"周杰伦",arrPeopele,@"梁静茹",arrPeopele,@"许飞",nil];
    [self create_button_with_frame:CGRectMake(width/15,470, 13*width/15,44) :@"选套餐" :@selector(ChooseCobmoButtonPressed:)];
    [self create_button_with_frame:CGRectMake(width/15,520, 13*width/15,44) :@"确定" :@selector(confirmButtonPressed:)];
}
-(void)Dictionary_name_price
{
    NSDictionary *dicKFC1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"超值多人餐",@"name",@"20",@"price",nil];
    NSDictionary *dicKFC2= [[NSDictionary alloc]initWithObjectsAndKeys:@"美味汉堡",@"name",@"11",@"price", nil];
    NSArray *arrKFC = [[NSArray alloc]initWithObjects:dicKFC1,dicKFC2,nil];
    NSDictionary *dicMDL1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"脆香油条",@"name",@"10",@"price", nil];
    NSDictionary *dicMDL2 =[[NSDictionary alloc]initWithObjectsAndKeys:@"圣代",@"name",@"8",@"price",nil];
    NSArray *arrMDL = [[NSArray alloc]initWithObjects:dicMDL1,dicMDL2 ,nil];
    NSDictionary *dicXbk1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"奶茶",@"name",@"8",@"price", nil];
    NSDictionary *dicXbk2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"胜利茶",@"name",@"12",@"price",nil];
    NSArray *arrXbc =[[NSArray alloc]initWithObjects:dicXbk1,dicXbk2,nil];
    m_dicComboData =[[NSDictionary alloc]initWithObjectsAndKeys:arrKFC,@"KFC",arrMDL,@"MDL",arrXbc,@"星巴克",nil];

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
     [self create_Label_frame_button];
     [self Dictionary_name_price];
//     double width = self.view.frame.size.width;
//    [self createLabelWithText:@"人：" :CGRectMake(width/15, 20, 120, 44)];
//    [self createLabelWithText:@"餐厅：" :CGRectMake(width/15, 200, 120, 44)];
//    [self createLabelWithText:@"套餐:" :CGRectMake(width/15, 370, 120, 44)];
//    m_nameLabel = [self createSelectLabelWithBorder :CGRectMake(width/15,70, 13*width/15,44)];
//    m_resrveLabel = [self createSelectLabelWithBorder:CGRectMake(width/15, 250, 13*width/15, 44)];
//    m_cobmoLabel = [self createSelectLabelWithBorder:CGRectMake(width/15,420, 13*width/15,44)];
// 按钮‘选人’
//    [self create_button_with_frame:CGRectMake(width/15,140, 13*width/15,44) :@"选人" :@selector(choosePeopleButtonPressed:)];
////   返回button‘s及text.
//    UIBarButtonItem *backItemReservationEat = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
//    backItemReservationEat.tintColor = [UIColor whiteColor];
//     [self.navigationItem setBackBarButtonItem:backItemReservationEat];
////    按钮'选餐厅'
//     [self create_button_with_frame:CGRectMake(width/15,320, 13*width/15,44) :@"选餐厅" :@selector(ResrveForRestaurantButtonPressed:)];
//     NSArray *arrPeopele = [[NSArray alloc]initWithObjects:@"KFC",@"MDL",@"星巴克", nil];
//    m_dicResrveLabel = [[NSDictionary alloc]initWithObjectsAndKeys:arrPeopele,@"许嵩",arrPeopele,@"周杰伦",arrPeopele,@"梁静茹",arrPeopele,@"许飞",nil];
////   按钮“选套餐”
//     [self create_button_with_frame:CGRectMake(width/15,470, 13*width/15,44) :@"选套餐" :@selector(ChooseCobmoButtonPressed:)];
//    NSDictionary *dicKFC1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"超值多人餐",@"name",@"20",@"price",nil];
//    NSDictionary *dicKFC2= [[NSDictionary alloc]initWithObjectsAndKeys:@"美味汉堡",@"name",@"11",@"price", nil];
//    NSArray *arrKFC = [[NSArray alloc]initWithObjects:dicKFC1,dicKFC2,nil];
//    NSDictionary *dicMDL1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"脆香油条",@"name",@"10",@"price", nil];
//    NSDictionary *dicMDL2 =[[NSDictionary alloc]initWithObjectsAndKeys:@"圣代",@"name",@"8",@"price",nil];
//    NSArray *arrMDL = [[NSArray alloc]initWithObjects:dicMDL1,dicMDL2 ,nil];
//    NSDictionary *dicXbk1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"奶茶",@"name",@"8",@"price", nil];
//    NSDictionary *dicXbk2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"胜利茶",@"name",@"12",@"price",nil];
//    NSArray *arrXbc =[[NSArray alloc]initWithObjects:dicXbk1,dicXbk2,nil];
//    m_dicComboData =[[NSDictionary alloc]initWithObjectsAndKeys:arrKFC,@"KFC",arrMDL,@"MDL",arrXbc,@"星巴克",nil];
//    确定按钮
//     [self create_button_with_frame:CGRectMake(width/15,520, 13*width/15,44) :@"确定" :@selector(confirmButtonPressed:)];
     }

- (UIButton *)create_button_with_frame :(CGRect)frame :(NSString *)btn_title :(SEL)pressed_event
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:btn_title forState:UIControlStateNormal];
    button.layer.cornerRadius = 10.0f;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];
    button.layer.masksToBounds = YES;
    [button addTarget:self action:pressed_event forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
 }

- (NSString *)getFilePathWithFileName :(NSString *)fileName
 {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取沙盒中Documents文件的路径
    NSString *str_file_path = [paths objectAtIndex:0];
    //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
    NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:fileName];
    return str_data_file_path;
 }

-(void)confirmButtonPressed :(id)sender
{
    if(![m_nameLabel.text isEqualToString: @""] && ![m_resrveLabel.text  isEqualToString: @""] && ![m_cobmoLabel.text  isEqualToString: @""])
    {
        NSString *str_data_file_path = [self getFilePathWithFileName:@"order.plist"];
        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:m_nameLabel.text,@"name",m_resrveLabel.text,@"restaurant",m_cobmoLabel.text,@"combo",m_strprice,@"price",nil];
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
// 字典要显示的内容根。
    NSArray *cobomArray = [m_dicComboData objectForKey:m_resrveLabel.text];
    ChooseCombo *chooseCobmo = [[ChooseCombo alloc]initWithDataArray:cobomArray];
    [self.navigationController pushViewController:chooseCobmo animated:YES];
 }

@end

