//
//  ClockTableViewCell.h
//  Clock
//
//  Created by willard on 2016/10/1.
//  Copyright © 2016年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Alarm;
@interface AlarmTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagLabel;
@property (strong, nonatomic) IBOutlet UISwitch *activeSwitch;
@property (weak) Alarm *alarm;
- (void)initWithAlarm:(Alarm *)alarm;
@end
