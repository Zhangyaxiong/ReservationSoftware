//
//  Query Message.m
//  Reservation software
//
//  Created by 张亚雄 on 15/7/7.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "FindOrderTableViewController.h"

@interface FindOrderTableViewController ()

@end

@implementation FindOrderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    m_arr_data_source = [self read_file_from_path];
}

- (NSArray *)read_file_from_path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取沙盒中Documents文件的路径
    NSString *str_file_path = [paths objectAtIndex:0];
    //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
    NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:@"order.plist"];
    NSArray *array_data_source = [[NSArray alloc]initWithContentsOfFile:str_data_file_path];
    return array_data_source;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return m_arr_data_source.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"已定人员";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    NSDictionary *dic_info = [m_arr_data_source objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic_info objectForKey:@"combo"];
    cell.detailTextLabel.text = [dic_info objectForKey:@"restaurant"];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


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
@end