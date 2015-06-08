//
//  TableViewCell.m
//  Reservation software
//
//  Created by 张亚雄 on 15/6/2.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        self.left_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,10 , 50, 50)];
        self.right_text = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, (self.frame.size.width - 160), 30)];
        [self addSubview:self.left_imageView];
        [self addSubview:self.right_text];
        
    }
    return self;
    
}

@end
