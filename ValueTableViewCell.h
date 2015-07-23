//
//  ValueTableViewCell.h
//  Reservation software
//
//  Created by 张亚雄 on 15/7/10.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValueTableViewCell : UITableViewCell

@property(nonatomic,retain)UILabel *price_text_label;
@property(nonatomic,retain)UILabel *name_text_label;
@property(nonatomic,retain)UILabel *combo_text_label;
@property(nonatomic,retain)UILabel *restaurant_text_label;
@property(nonatomic,retain)UILabel *money_text_label;
@end
