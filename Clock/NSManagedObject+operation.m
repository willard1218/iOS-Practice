//
//  NSManagedObject+operation.m
//  Clock
//
//  Created by willard on 2016/10/5.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "NSManagedObject+operation.h"
#import "AppDelegate.h"
@implementation NSManagedObject (operation)
- (void)save {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app saveContext];
}

- (void)delete {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.persistentContainer.viewContext deleteObject:self];
}
@end
