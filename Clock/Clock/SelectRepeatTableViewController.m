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
static  AlertRepeatDayOption repeatDayOptions;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    repeatDayOptions =  AlertRepeatDayOptionMonday | AlertRepeatDayOptionFriday;
        
    self.tableView.frame = CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 10);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    if (OptionsHasValue(repeatDayOptions, [DAY_OPTIONS[indexPath.row] intValue])) {
      cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Every %@", DAYS[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AlertRepeatDayOption selectedOption = [DAY_OPTIONS[indexPath.row] intValue];

    if (OptionsHasValue(repeatDayOptions,selectedOption)) {
        repeatDayOptions &=  ~selectedOption;
    }
    else {
        repeatDayOptions |= [DAY_OPTIONS[indexPath.row] intValue];
    }
    
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
