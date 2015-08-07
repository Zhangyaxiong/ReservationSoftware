//
//  ValueTableViewCell.m
//  Reservation software
//
//  Created by 张亚雄 on 15/7/10.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ValueTableViewCell.h"
#import "ReservationOrderContent.h"

@implementation ValueTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
      self.name_text_label = [self create_label_with_frame:CGRectMake( 10, 12,60,10) :20.0f];
      self.combo_text_label=[self create_label_with_frame:CGRectMake(60,12 , 100, 80) :15.0f];
      self.restaurant_text_label =[self create_label_with_frame:CGRectMake(10, 12, 60, 80) :15.0f];
      self.price_text_label = [self create_label_with_frame:CGRectMake(320,20,(self.frame.size.width - 160),30 ):15.0f];
    }
    return self;
}
-(UILabel *)create_label_with_frame:(CGRect)frame :(double)fontSize
{
    UILabel *label =[[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    [self addSubview:label];
    return label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
