//
//  ClockTableViewCell.m
//  Clock
//
//  Created by willard on 2016/10/1.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "AlarmTableViewCell.h"
#import "Alarm+CoreDataClass.h"
#import "NSManagedObject+operation.h"
@implementation AlarmTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_activeSwitch addTarget:self action:@selector(setState:) forControlEvents:UIControlEventValueChanged];

}

- (void)initWithAlarm:(Alarm *)alarm {
    _timeLabel.text = [[Alarm getDateFormatter] stringFromDate:alarm.time];
    _tagLabel.text = alarm.label;
    _activeSwitch.on = alarm.isEnable;
    _alarm = alarm;
}

- (void)setState:(UISwitch *)activeSwitch
{
    _alarm.isEnable = activeSwitch.isOn;
    [_alarm save];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
