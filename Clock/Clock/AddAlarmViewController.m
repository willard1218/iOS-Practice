//
//  AddAlarmViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "AddAlarmViewController.h"
#import "SelectLabelViewController.h"
#import "SelectRepeatTableViewController.h"
#import "SelectSoundTableViewController.h"

#import "AppDelegate.h"
#import "NSManagedObject+operation.h"

typedef NS_ENUM(NSInteger, AddAlarmTableViewCellRow) {
    AddAlarmTableViewCellRowRepeat,
    AddAlarmTableViewCellRowLabel,
    AddAlarmTableViewCellRowSound,
    AddAlarmTableViewCellRowSnooze
    
};
@interface AddAlarmViewController ()

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIButton *deleteButton;

@end

@implementation AddAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    if (!_isAddMode) {
        _datePicker.date = _alarm.time;
        self.title = @"Edit Alarm";
        [_deleteButton addTarget:self action:@selector(deleteAlarmAndPopViewController) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.superview.hidden = NO;
        return;
    }
    
    _deleteButton.superview.hidden = YES;
    self.title = @"Add Alarm";
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _alarm = [NSEntityDescription
                    insertNewObjectForEntityForName:NSStringFromClass(Alarm.class)
                    inManagedObjectContext:app.persistentContainer.viewContext];
    
    _alarm.label = @"Alarm";
    _alarm.repeatDayOptions = AlertRepeatDayOptionNone;
    _alarm.soundID = 0;
    _alarm.isSnooze = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

- (IBAction)saveButtonDidTap:(UIBarButtonItem *)sender {
    _alarm.time = _datePicker.date;
    _alarm.createdAt = [[NSDate alloc] init];
    _alarm.isEnable = YES;
    [_alarm save];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelButtonDidTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (!_isAddMode) {
        return;
    }
    
    [_alarm delete];
}

- (void)deleteAlarmAndPopViewController {
    [self.navigationController popViewControllerAnimated:YES];
    [_alarm delete];
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
            cell.detailTextLabel.text = [_alarm getRepeatOptionsText];
            break;
        case AddAlarmTableViewCellRowLabel:
            cell.textLabel.text = @"Label";
            cell.detailTextLabel.text = _alarm.label;
            break;
        case AddAlarmTableViewCellRowSound:
        {
            cell.textLabel.text = @"Sound";
            NSString *musicText = MUSICS[_alarm.soundID];
            cell.detailTextLabel.text = [self capitalizedTitleString:musicText];
            break;
        }
        case AddAlarmTableViewCellRowSnooze:
        {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Snooze";
            UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
            switchview.on = _alarm.isSnooze;
            [switchview addTarget:self
                           action:@selector(switchStateChanged:)
                 forControlEvents:UIControlEventValueChanged];
            
            cell.accessoryView = switchview;
            break;
        }
    }
    
    return cell;
}

- (void)switchStateChanged:(UISwitch *) uiSwitch {
    _alarm.isSnooze = uiSwitch.on ;
}

- (NSString *)capitalizedTitleString:(NSString *)title {
    NSMutableArray *texts = [NSMutableArray arrayWithArray:
                             [title componentsSeparatedByString:@"_"]];
    for (int i = 0 ; i < texts.count; i++ ) {
        texts[i] = [texts[i] capitalizedString];
    }
    
    return [texts componentsJoinedByString:@" "];;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case AddAlarmTableViewCellRowRepeat:
        {
            SelectRepeatTableViewController *vc = [[SelectRepeatTableViewController alloc] init];
            vc.alarm = _alarm;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case AddAlarmTableViewCellRowLabel: {
            SelectLabelViewController *vc = [[SelectLabelViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            vc.alarm = _alarm;
            break;
        }
        case AddAlarmTableViewCellRowSound: {
            SelectSoundTableViewController *vc = [[SelectSoundTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            vc.alarm = _alarm;
        }    break;
        case AddAlarmTableViewCellRowSnooze:
            break;
    }

}


@end
