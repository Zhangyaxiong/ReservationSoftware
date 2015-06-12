//
//  ChooseCombo.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/12.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ChooseCombo.h"

@interface ChooseCombo ()

@end

@implementation ChooseCombo
@synthesize ComboArray;
@synthesize tableviewCombo;

-(void)presentationTableview
{
    
    tableviewCombo = [[UITableView alloc]initWithFrame: CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)style:UITableViewStylePlain];
    tableviewCombo.delegate = self;
    
    tableviewCombo.dataSource = self;
    
    [self.view addSubview:tableviewCombo];
   
    NSArray *ArrayC = [[NSArray alloc]initWithObjects:@"小吃",@"中餐",@"西餐", nil];
    
    ComboArray  = ArrayC;
    

    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选套餐";
    
    [self presentationTableview];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return[ComboArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 80;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellCombo = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellCombo];
    
    // Configure the cell...
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellCombo];
        
    }
    cell.textLabel.text = [ComboArray objectAtIndex:[indexPath row]];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleStringCobmo =[ComboArray objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionCobmo" object:titleStringCobmo userInfo:nil];
    [self. navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


@end
