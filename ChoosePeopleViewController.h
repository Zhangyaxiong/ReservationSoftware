//
//  ChooseViewController.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/9.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosePeopleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *tableview;
    
    NSArray *nameArray; //创建个数组来放我们的数据
    
    
    
}

@property (strong,nonatomic)UITableView *tableview;

@property (strong,nonatomic)NSArray *nameArray;

@end
