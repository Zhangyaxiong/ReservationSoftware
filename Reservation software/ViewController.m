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
    
    
    self.navigationItem.title = @"订餐";
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    double width = self.view.frame.size.width;
    
    [self create_button: width :@selector(order_button_pressed:) :90 :@"帮订餐"];
    [self create_button: width :@selector(look_up_ordered_restaurant:) :150 :@"看订餐"];
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItem.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if(!docDir)
    {
        NSLog(@"Douments 目录未找到");
    }
   
    NSArray *array = [[NSArray alloc]initWithObjects:@"内容",@"content", nil];
    
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    
     [array writeToFile:filePath atomically:YES];
  
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
    FindOrderTableViewController *find_order = [[FindOrderTableViewController alloc]init];
    [self.navigationController pushViewController:find_order animated:YES];

}

@end
