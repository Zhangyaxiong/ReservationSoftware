//
//  TableViewCell.h
//  Reservation software
//
//  Created by 张亚雄 on 15/6/2.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView  *left_imageView;
@property(nonatomic,retain)UILabel      *right_text;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
