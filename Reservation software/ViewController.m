//
//  ViewController.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/2.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//  设置导航菜单名称
    self.navigationItem.title = @"订餐";
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [self create_button_size_width];
    [self arry_filePath_nameArray_filePathName];
}
-(void)create_button_size_width
{
    double width = self.view.frame.size.width;
    //    设置字体大小
    [self create_button: width :@selector(order_button_pressed:) :90 :@"帮订餐"];
    [self create_button: width :@selector(look_up_ordered_restaurant:) :150 :@"看订餐"];
}
-(void)backItem
{
    //  设置返回页面
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItem.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
}
-(void)arry_filePath_nameArray_filePathName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if(!docDir)
    {
        NSLog(@"Douments 目录未找到");
    }
    NSArray *array = [[NSArray alloc]initWithObjects:@"内容",@"content", nil];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    [array writeToFile:filePath atomically:YES];
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞",nil];
    NSString *filePathName = [docDir stringByAppendingPathComponent:@"nameFile.plist"];
    [nameArray writeToFile:filePathName atomically:YES];
}
- (UIButton *)create_button :(double)width :(SEL)btn_pressed :(double)y :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:btn_pressed forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(width/8,y , 3*width/4, 35);
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.cornerRadius = 10.0;
    [self.view addSubview:button];
    return button;
}
-(void)order_button_pressed:(id)sender
{
     OrderViewController *order = [[OrderViewController alloc]init];
     [self.navigationController pushViewController:order animated:YES];
}
- (void)look_up_ordered_restaurant :(id)sender
{
    order_title_info *find_order = [[order_title_info alloc]init];
    [self.navigationController pushViewController:find_order animated:YES];
}

@end
