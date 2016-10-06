//
//  ClockViewController.m
//  Clock
//
//  Created by willard on 2016/10/1.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "AlarmViewController.h"
#import "AlarmTableViewCell.h"
#import "UIColor+ADKHexPresentation.h"
#import "Alarm+CoreDataClass.h"
#import "AppDelegate.h"
#import "NSManagedObject+operation.h"
#import "AddAlarmViewController.h"

@interface AlarmViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) NSMutableArray <Alarm *>*alarms;
@end

@implementation AlarmViewController

- (void)initFakeAlarms {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Alarms"
                                                     ofType:@"json"];
    
    NSString *content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *alarms = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    for (NSDictionary *alarmJson in alarms) {
        
        Alarm *alarm = [NSEntityDescription
                        insertNewObjectForEntityForName:NSStringFromClass(Alarm.class)
                        inManagedObjectContext:app.persistentContainer.viewContext];
        [alarm initWithDictionary:alarmJson];
    }
    
    [app saveContext];
}

- (void)editButtonDidTap {
    NSArray *buttonStates = @[@"Done",@"Edit"];
    _editButton.title = buttonStates[_tableView.isEditing];
    [_tableView setEditing:!_tableView.isEditing animated:YES];
}


- (void)deleteAll {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSError *error = nil;
    NSArray *alarms =
    [app.persistentContainer.viewContext executeFetchRequest:[Alarm fetchRequest] error:&error];

    for (Alarm *alarm in alarms) {
        NSLog(@"%@",alarm);
        [alarm delete];
    }
    
    [app saveContext];
}

- (NSMutableArray *)fetchAllAlarms {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSError *error = nil;
    NSFetchRequest<Alarm *> *fetchRequest = [Alarm fetchRequest];
    NSArray *alarms =
    [app.persistentContainer.viewContext executeFetchRequest:fetchRequest error:&error];
    alarms = [alarms sortedArrayUsingComparator:^NSComparisonResult(Alarm *obj1 , Alarm *obj2) {
        NSString *alarmTime1 = [[Alarm getDateFormatter] stringFromDate:obj1.time];
        NSString *alarmTime2 = [[Alarm getDateFormatter] stringFromDate:obj2.time];
        return ([alarmTime1 compare:alarmTime2]);
    }];

    return [NSMutableArray arrayWithArray:alarms];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Alarm";
    [self deleteAll];
    [self initFakeAlarms];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.allowsSelectionDuringEditing = YES;
    _editButton.target = self;
    _editButton.action = @selector(editButtonDidTap);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _alarms = [self fetchAllAlarms];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _alarms.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Alarm *alarm = _alarms[indexPath.row];
        [alarm delete];
        [alarm save];
        [_alarms removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"AlarmTableViewCell";
    
    AlarmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[NSBundle mainBundle] loadNibNamed:@"AlarmTableViewCell" owner:self options:nil][0];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell initWithAlarm:_alarms[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( !tableView.isEditing ) {
        return;
    }
    
    [self performSegueWithIdentifier:@"pushToAdd" sender:indexPath];
   
}


 #pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     AddAlarmViewController *vc = segue.destinationViewController;
     if ([sender isKindOfClass:NSIndexPath.class]) {
         vc.alarm = _alarms[((NSIndexPath *)sender).row];
         vc.isAddMode = NO;
         return;
     }
     
     vc.isAddMode = YES;

 }
 

@end
