//
//  ChooseCombo.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/12.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseCombo : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
//    UITableView *tableviewCombo;
    
    NSArray *ComboArray;
}

//@property(strong,nonatomic)UITableView *tableviewCombo;

@property(strong,nonatomic)NSArray *ComboArray;


-(id)initWithDataArray :(NSArray *)ComboArray;

@end
