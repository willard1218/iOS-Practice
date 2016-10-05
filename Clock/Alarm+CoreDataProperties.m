//
//  Alarm+CoreDataProperties.m
//  Clock
//
//  Created by willard on 2016/10/5.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "Alarm+CoreDataProperties.h"

@implementation Alarm (CoreDataProperties)

+ (NSFetchRequest<Alarm *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Alarm"];
}

@dynamic createdAt;
@dynamic isSnooze;
@dynamic label;
@dynamic repeatDayOptions;
@dynamic soundID;
@dynamic time;
@dynamic isEnable;
@dynamic updatedAt;

@end
