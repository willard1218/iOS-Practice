//
//  Alarm+CoreDataProperties.m
//  Clock
//
//  Created by willard on 2016/10/4.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "Alarm+CoreDataProperties.h"

@implementation Alarm (CoreDataProperties)

+ (NSFetchRequest<Alarm *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Alarm"];
}

@dynamic repeatDayOptions;
@dynamic label;
@dynamic soundID;
@dynamic isSnooze;

@end
