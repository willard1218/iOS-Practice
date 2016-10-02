//
//  SelectLabelViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "SelectLabelViewController.h"

@interface SelectLabelViewController ()
@property UITextField *textField;
@end

@implementation SelectLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Label";
    self.view.backgroundColor = [UIColor whiteColor];
    _textField = [[UITextField alloc] init];
    _textField.text = @"Alarm";
    _textField.frame = CGRectMake(10, 100, self.view.frame.size.width, 30);
    _textField.backgroundColor = [UIColor grayColor];
    _textField.returnKeyType = UIReturnKeyDone;
    [_textField becomeFirstResponder];
    [self.view addSubview:_textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
