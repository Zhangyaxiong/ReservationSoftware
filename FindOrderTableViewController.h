//
//  Query Message.h
//  Reservation software
//
//  Created by 张亚雄 on 15/7/7.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindOrderTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *m_arr_data_source;
    NSMutableArray *m_arr_data_sources;
    
}
@property(nonatomic,retain)UITableView *tableView;
@property(strong,nonatomic) NSArray *listData;

@end
