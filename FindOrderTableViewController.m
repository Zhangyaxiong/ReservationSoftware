//
//  Query Message.m
//  Reservation software
//
//  Created by 张亚雄 on 15/7/7.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "FindOrderTableViewController.h"
#import "ValueTableViewCell.h"

@interface FindOrderTableViewController ()

@end

@implementation FindOrderTableViewController
@synthesize listData=_listData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    m_arr_data_source = [self read_file_from_path:@"order.plist"];
    m_arr_data_source2 = [self read_file_from_path:@"nameFile.plist"];


}
//沙盒
- (NSArray *)read_file_from_path:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取沙盒中Documents文件的路径
    NSString *str_file_path = [paths objectAtIndex:0];
    //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
    NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:fileName];
    NSArray *array_data_source = [[NSArray alloc]initWithContentsOfFile:str_data_file_path];
    return array_data_source;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/* 这个函数是显示tableview的章节数*/
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 2;
}


/*设置标题尾的宽度*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

/*设置标题头的名称*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor brownColor];
    if (section == 0)
    {
        UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(0,0,200,30)];
        label1.text = @"已定套餐";
       
        [view addSubview:label1];
    }
    else
    {
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        lable2.text = @"未定套餐";
        
        
        [view addSubview:lable2];
        
    }
    return view;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return m_arr_data_source.count;
    }
    if (section == 1)
    {
        return m_arr_data_source2.count;
    }
    return 0;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    声明静态字符串型对象，用来标记重用单元格
    static NSString *CellIdentifier = @"cells";
    //    用TableSampleIdentifier表示需要重用的单元
    ValueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //    如果如果没有多余单元，则需要创建新的单元
    
    if (cell == nil)
    {
        cell = [[ValueTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    
    if (indexPath.section == 0)
    {
        //    获取当前行信息值
        NSUInteger row = [indexPath row];
        //    name txte label = [[ sha he shu ju yuan zhong lei zhi yin ] yin yong zi dian nei ming cheng]
        cell.name_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"name"];
        cell.price_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"price"];
        cell.restaurant_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"restaurant"];
        cell.combo_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"combo"];
    }
    if (indexPath.section == 1)
    {
        cell.textLabel.text = [m_arr_data_source2 objectAtIndex:indexPath.row];
    }
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 80;
}


@end
    



//
// - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
// if (editingStyle == UITableViewCellEditingStyleDelete)
// {
//     
// [tableView deleteRowsAtIndexPaths:@[m_arr_data_source] withRowAnimation:UITableViewRowAnimationFade];
// } else if (editingStyle == UITableViewCellEditingStyleDelete)


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */




