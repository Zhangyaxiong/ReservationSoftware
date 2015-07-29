//
//  ValueTableViewCell.m
//  Reservation software
//
//  Created by 张亚雄 on 15/7/10.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ValueTableViewCell.h"


@implementation ValueTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
//    设置各个数据的位置坐标，其中这里重点学习了全部局坐标的展示。
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.name_text_label =[[UILabel alloc]initWithFrame:CGRectMake( 10, 12,60,10)];
        self.combo_text_label=[[UILabel alloc]initWithFrame:CGRectMake(60,12 , 100, 80)];
        self.restaurant_text_label = [[UILabel alloc]initWithFrame:CGRectMake(10, 12, 60, 80)];
        self.price_text_label = [[UILabel alloc]initWithFrame:CGRectMake(320, 20, (self.frame.size.width - 160), 30)];
        self.money_text_label = [[UILabel alloc]initWithFrame:CGRectMake(320, 20, (self.frame.size.width - 130), 30)];
        self.name_text_label.font = [UIFont boldSystemFontOfSize:20.0f];
        self.combo_text_label.font =[UIFont boldSystemFontOfSize:15.0f];
        self.restaurant_text_label.font = [UIFont boldSystemFontOfSize:15.0f];
        [self addSubview:self.name_text_label];
        [self addSubview:self.combo_text_label];
        [self addSubview:self.restaurant_text_label];
        [self addSubview:self.price_text_label];
        [self addSubview:self.money_text_label];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
