//
//  ClockViewController.m
//  Clock
//
//  Created by willard on 2016/10/1.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "ClockViewController.h"
#import "ClockTableViewCell.h"
@interface ClockViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ClockViewController
- (IBAction)editButtonDidTap:(UIBarButtonItem *)sender {
}
- (IBAction)addButtonDidTap:(UIBarButtonItem *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ClockTableViewCell";
    
    ClockTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ClockTableViewCell" owner:self options:nil][0];

        
    }
    return cell;
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
