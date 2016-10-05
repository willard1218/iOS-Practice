//
//  SelectSoundTableViewController.h
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm+CoreDataClass.h"
@interface SelectSoundTableViewController : UITableViewController
@property (weak, nonatomic) Alarm *alarm;
@end
