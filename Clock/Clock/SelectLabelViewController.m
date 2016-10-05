//
//  SelectLabelViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "SelectLabelViewController.h"
#import "UIColor+ADKHexPresentation.h"
@interface SelectLabelViewController ()
@property UITextField *textField;
@end

@implementation SelectLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Label";
    self.view.backgroundColor = [UIColor whiteColor];
    _textField = [[UITextField alloc] init];
    _textField.text = _alarm.label;
    _textField.frame = CGRectMake(10, 100, self.view.frame.size.width, 30);
    _textField.backgroundColor = [UIColor ADKColorWithHexString:@"#f4f0d4"];
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.delegate = self;
    [_textField becomeFirstResponder];
    [self.view addSubview:_textField];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    _alarm.label = textField.text;
    [textField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

@end
