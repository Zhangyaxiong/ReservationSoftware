//
//  ResrveForRestaurant.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/12.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResrveForRestaurant : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableviewRestaurant;
    NSArray *resrveArray;
}
//这是什么意思
@property(strong,nonatomic)UITableView *tableviewRestaurant;

@property(strong,nonatomic)NSArray *resrveArray;

@end
