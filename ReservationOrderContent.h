//
//  AddPice.h
//  Reservation software
//
//  Created by 张亚雄 on 15/8/4.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface order_title_info : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *m_arr_data_source;
    //    改成为订餐的名，成员变量名用M
    NSMutableArray *m_arr_data_didfferent_source;
    int person_number;
}
@end
