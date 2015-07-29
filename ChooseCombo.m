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
-(id)initWithDataArray :(NSArray *)comboArray
  {
    
    self = [super init];
    
      if (self)
    {
    
        ComboArray = comboArray;
    
    }
    
      return self ;
  }

-(void)presentationTableview
 {
    
    
     tableviewCombo = [[UITableView alloc]initWithFrame: CGRectMake(0, 0,self.view.bounds.size.width,
                                                                   self.view.bounds.size.height)style:UITableViewStylePlain];
   
     tableviewCombo.delegate = self;
    
    
     tableviewCombo.dataSource = self;
    
    
     [self.view addSubview:tableviewCombo];
   
    
 }
//警告
- (void)didReceiveMemoryWarning

 {
    
    [super didReceiveMemoryWarning];
    
 }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     static NSString *CellCombo = @"cell";
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellCombo];
    
    
     if(cell == nil)
     
     {
       
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellCombo];
        
     }
     
     int row = (int)indexPath.row;
     
     cell.textLabel.text = [[ComboArray objectAtIndex:row]objectForKey:@"name"];
     
     cell.detailTextLabel.text = [[ComboArray objectAtIndex:row]objectForKey:@"price"];
    
     cell.textLabel.numberOfLines = 10;
    
     cell.textLabel.font = [UIFont systemFontOfSize:20];
    
     cell.textLabel.textColor = [UIColor blueColor];
    
     return cell;
 }

- (void)viewDidLoad

{
    [super viewDidLoad];
     
     self.title = @"选套餐";
    
    [self presentationTableview];
    
   
 }
//截成几段

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    return 1;

 }
//返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

 {

    return[ComboArray count];
 
 }
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

 {
    
    return 80;
    
 }



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

 {
//    字典= 数字/行数
     NSDictionary *titleStringCobmo =[ComboArray objectAtIndex:[indexPath row]];
// 通知指令
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionCobmo" object:titleStringCobmo userInfo:nil];
// 这句话什么意思
    [self. navigationController popViewControllerAnimated:YES];
 
 }



@end
