//
//  ChooseViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/9.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ChoosePeopleViewController.h"
#import "OrderViewController.h"

@implementation ChoosePeopleViewController


-(void)drawTableView
 {
     tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)style:UITableViewStylePlain];
    //    delegate：委派
    tableview.delegate = self;
     //    dataSource:数据源
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    NSArray *array = [[NSArray alloc]initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞", nil];
    nameArray  = array;
 }
- (void)didReceiveMemoryWarning
 {
    [super didReceiveMemoryWarning];
 }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

 {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [nameArray objectAtIndex:[indexPath row]];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
 }

- (void)viewDidLoad
 {
     [super viewDidLoad];
     self.title = @"订餐";
     [self drawTableView];
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
 {
    return 1;
 }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
 {
     return [nameArray count];
 }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    return 80;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSString *titileString = [nameArray objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionName" object:titileString userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
 }

@end
