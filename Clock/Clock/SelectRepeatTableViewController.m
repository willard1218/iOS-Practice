//
//  SelectRepeatTableViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "SelectRepeatTableViewController.h"
#import "Alarm+CoreDataClass.h"

@interface SelectRepeatTableViewController ()
@end

@implementation SelectRepeatTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.frame = CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 10);
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DAYS count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = @"SelectRepeatTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier] ;
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    if (OptionsHasValue(_alarm.repeatDayOptions, [DAY_OPTIONS[indexPath.row] intValue])) {
      cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Every %@", DAYS[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AlertRepeatDayOption selectedOption = [DAY_OPTIONS[indexPath.row] intValue];

    if (OptionsHasValue(_alarm.repeatDayOptions,selectedOption)) {
        _alarm.repeatDayOptions &=  ~selectedOption;
    }
    else {
        _alarm.repeatDayOptions |= [DAY_OPTIONS[indexPath.row] intValue];
    }
    
    [self.tableView reloadData];
}

@end
