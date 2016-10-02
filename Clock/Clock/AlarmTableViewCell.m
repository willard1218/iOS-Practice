//
//  ClockTableViewCell.m
//  Clock
//
//  Created by willard on 2016/10/1.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "AlarmTableViewCell.h"

@implementation AlarmTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _timeLabel.text = @"16:46";
    _tagLabel.text = @"Alarm";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
