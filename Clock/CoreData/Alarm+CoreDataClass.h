//
//  Alarm+CoreDataClass.h
//  Clock
//
//  Created by willard on 2016/10/4.
//  Copyright © 2016年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSUInteger, AlertRepeatDayOption) {
    AlertRepeatDayOptionNone = 0,
    AlertRepeatDayOptionMonday = 1 << 1,
    AlertRepeatDayOptionTuesday = 1 << 2,
    AlertRepeatDayOptionWednesday = 1 << 3,
    AlertRepeatDayOptionThursday = 1 << 4,
    AlertRepeatDayOptionFriday = 1 << 5,
    AlertRepeatDayOptionSaturday = 1 << 6,
    AlertRepeatDayOptionSunday = 1 << 7,
};

#define DAY_OPTIONS  @[ @(AlertRepeatDayOptionMonday)   , \
                        @(AlertRepeatDayOptionTuesday)  , \
                        @(AlertRepeatDayOptionWednesday), \
                        @(AlertRepeatDayOptionThursday) , \
                        @(AlertRepeatDayOptionFriday)   , \
                        @(AlertRepeatDayOptionSaturday) , \
                        @(AlertRepeatDayOptionSunday)     \
                      ]

#define DAYS  @[ @"Monday", \
                        @"Tuesday", \
                        @"Wednesday",  \
                        @"Thursday", \
                        @"Friday", \
                        @"Saturday", \
                        @"Sunday" \
               ]

#define MUSICS  @[ @"super_mario_bros", \
@"love_me_like_you_do", \
@"super_ringtone",  \
@"ppap", \
@"frozen" ]


#define OptionsHasValue(options, value) (((options) & (value)) == (value))
@interface Alarm : NSManagedObject
- (void)initWithDictionary:(NSDictionary *)dict;
- (NSString *) getRepeatOptionsText;
+ (NSDateFormatter *)getDateFormatter;
@end

NS_ASSUME_NONNULL_END

#import "Alarm+CoreDataProperties.h"
