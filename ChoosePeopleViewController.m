//
//  ChooseViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/9.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ChoosePeopleViewController.h"
#import "OrderViewController.h"
@interface ChoosePeopleViewController ()

@end

@implementation ChoosePeopleViewController
@synthesize tableview;
@synthesize nameArray;



-(void)drawTableView

{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)style:UITableViewStylePlain];
    
    //    delegate：委派
    tableview.delegate = self;
    //    dataSource:数据源
    tableview.dataSource = self;
    
    [self.view addSubview:tableview];
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞",@"凤凰传奇",@"阿杜",@"方大同",@"林俊杰",@"胡夏",@"邱永传", nil];
    
    nameArray  = array;
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订餐";
    // Do any additional setup after loading the view.
     [self drawTableView];
    UIBarButtonItem *backItem1 = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItem1.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem1];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView//显示章节数

{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [nameArray count];
    //这个是指定加载数据的多少即显示多少个cell，如果这个地方弄错了会崩溃的哟
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 80;
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
//    点击后出现固定值
    NSString *titileString = [nameArray objectAtIndex:[indexPath row]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"notfactionName" object:titileString];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionName" object:titileString userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
