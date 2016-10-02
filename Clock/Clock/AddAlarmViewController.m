//
//  AddAlarmViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "AddAlarmViewController.h"
#import "SelectLabelViewController.h"
typedef NS_ENUM(NSInteger, AddAlarmTableViewCellRow) {
    AddAlarmTableViewCellRowRepeat,
    AddAlarmTableViewCellRowLabel,
    AddAlarmTableViewCellRowSound,
    AddAlarmTableViewCellRowSnooze
    
};
@interface AddAlarmViewController ()

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation AddAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"AddAlarmTableViewCellRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] ;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case AddAlarmTableViewCellRowRepeat:
            cell.textLabel.text = @"Repeat";
            cell.detailTextLabel.text = @"Never";
            break;
        case AddAlarmTableViewCellRowLabel:
            cell.textLabel.text = @"Label";
            cell.detailTextLabel.text = @"Alarm";
            break;
        case AddAlarmTableViewCellRowSound:
            cell.textLabel.text = @"Sound";
            cell.detailTextLabel.text = @"Night";
            break;
        case AddAlarmTableViewCellRowSnooze:
            
            cell.textLabel.text = @"Snooze";
            UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
            switchview.on = YES;
            //            [switchview addTarget:self action:@selector(chick_Switch:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchview;
            break;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
    switch (indexPath.row) {
        case AddAlarmTableViewCellRowRepeat:
            break;
        case AddAlarmTableViewCellRowLabel: {
            SelectLabelViewController *vc = [[SelectLabelViewController alloc] init];
            
            [self presentViewController:vc animated:YES completion:nil];
            break;
        }
        case AddAlarmTableViewCellRowSound:
            break;
        case AddAlarmTableViewCellRowSnooze:
            break;
    }

}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
