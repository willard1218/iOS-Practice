//
//  NSManagedObject+operation.h
//  Clock
//
//  Created by willard on 2016/10/5.
//  Copyright © 2016年 willard. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (operation)
- (void)save;
- (void)delete;
@end
