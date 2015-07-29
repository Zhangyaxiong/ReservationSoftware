//
//  ResrveForRestaurant.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/12.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ResrveForRestaurant.h"

@implementation ResrveForRestaurant
@synthesize resrveArray;
@synthesize tableviewRestaurant;

-(void)introdceTableView
 {
    tableviewRestaurant = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)style:UITableViewStylePlain];
    //    delegate：委派
     tableviewRestaurant.delegate = self;
     //    dataSource:数据源
     tableviewRestaurant.dataSource = self;
     //  将 tableviewRestaurant  添加view 里
     [self.view addSubview:tableviewRestaurant];
    NSArray *arrayRest = [[NSArray alloc]initWithObjects:@"KFC",@"MDL",@"星巴克", nil];
    resrveArray  = arrayRest;
 }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    static NSString *CellResrve = @"cell";
    UITableViewCell *cell = [tableviewRestaurant dequeueReusableCellWithIdentifier: CellResrve];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellResrve];
    }
    cell.textLabel.text = [resrveArray objectAtIndex:[indexPath row]];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
 }
- (void)viewDidLoad
 {
    [super viewDidLoad];
    self.title = @"选餐厅";
    [self introdceTableView];
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
     return 1;
 }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
    return [resrveArray count];
 }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    return 80;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSString*titleStringResrve =[resrveArray objectAtIndex:[indexPath row]];
     [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionReare" object:titleStringResrve userInfo:nil];
     [self. navigationController popViewControllerAnimated:YES];
 }

- (void)didReceiveMemoryWarning
{
     [super didReceiveMemoryWarning];
}



@end
