//
//  OrderViewController.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController
 {
    UILabel *m_nameLabel;
    UILabel *m_resrveLabel;
    UILabel *m_cobmoLabel;
    NSDictionary *m_dicComboData;
    NSDictionary *m_dicResrveLabel;
    NSString *m_strprice;
 }

@end
