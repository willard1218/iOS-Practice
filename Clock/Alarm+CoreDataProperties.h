//
//  Alarm+CoreDataProperties.h
//  Clock
//
//  Created by willard on 2016/10/5.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "Alarm+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Alarm (CoreDataProperties)

+ (NSFetchRequest<Alarm *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *createdAt;
@property (nonatomic) BOOL isSnooze;
@property (nullable, nonatomic, copy) NSString *label;
@property (nonatomic) int16_t repeatDayOptions;
@property (nonatomic) int16_t soundID;
@property (nullable, nonatomic, copy) NSDate *time;
@property (nonatomic) BOOL isEnable;
@property (nullable, nonatomic, copy) NSDate *updatedAt;

@end

NS_ASSUME_NONNULL_END
