//
//  Alarm+CoreDataClass.m
//  Clock
//
//  Created by willard on 2016/10/4.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "Alarm+CoreDataClass.h"


@implementation Alarm
+ (NSDateFormatter *)getDateFormatter {
    static NSString *timeFormat = @"HH:mm";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = timeFormat ;
    return dateFormatter;
}

- (void)initWithDictionary:(NSDictionary *)dict {
    self.soundID = [dict[@"soundID"] intValue];
    self.isSnooze = [dict[@"isSnooze"] boolValue];
    self.repeatDayOptions = [dict[@"repeatDayOptions"] intValue];
    self.label = dict[@"label"];
    self.isEnable = [dict[@"isEnable"] boolValue];
    self.time = [[Alarm getDateFormatter] dateFromString:dict[@"time"]];
}

- (NSString *) getRepeatOptionsText{
    if (self.repeatDayOptions == AlertRepeatDayOptionNone) {
        return @"Never" ;
    }
    
    
    NSMutableArray *selectedDays = [NSMutableArray array];
    __block NSString *selectedDay;
    [DAY_OPTIONS enumerateObjectsUsingBlock:^(NSNumber *options, NSUInteger idx, BOOL * _Nonnull stop) {
        if (OptionsHasValue(self.repeatDayOptions, [options intValue])) {
            selectedDay = DAYS[idx];
            NSRange needleRange = NSMakeRange( 0, 3 );
            [selectedDays addObject:[selectedDay substringWithRange:needleRange]];
        }
    }];
    
    if (selectedDays.count == 1) {
        return [NSString stringWithFormat:@"Every %@", selectedDay];
    }
    
    if (selectedDays.count == DAYS.count) {
        return @"Every day" ;
    }
    
    return [selectedDays componentsJoinedByString:@" "];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Alarm\n"
            "    soundID : %d \n"
            "    isSnooze : %d \n"
            "    repeatDayOptions : %d \n"
            "    label : %@\n"
            "    isEnable : %d \n"
            "    time : %@\n", self.soundID, self.isSnooze, self.repeatDayOptions, self.label, self.isEnable,
            [[Alarm getDateFormatter] stringFromDate:self.time]];
}
@end
