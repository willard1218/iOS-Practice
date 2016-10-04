//
//  Alarm+CoreDataProperties.h
//  Clock
//
//  Created by willard on 2016/10/4.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "Alarm+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Alarm (CoreDataProperties)

+ (NSFetchRequest<Alarm *> *)fetchRequest;

@property (nonatomic) int16_t repeatDayOptions;
@property (nullable, nonatomic, copy) NSString *label;
@property (nonatomic) int16_t soundID;
@property (nonatomic) BOOL isSnooze;

@end

NS_ASSUME_NONNULL_END
