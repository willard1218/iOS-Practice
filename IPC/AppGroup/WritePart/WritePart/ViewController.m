//
//  ViewController.m
//  WritePart
//
//  Created by willard on 2017/1/17.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) UITextField *inputTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 200, 30)];
    _inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    _inputTextField.font = [UIFont systemFontOfSize:15];
    _inputTextField.placeholder = @"enter text";
    _inputTextField.returnKeyType = UIReturnKeyDone;
    
    [self.view addSubview:_inputTextField];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(writeloop) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)writeloop {
    static int a = 0;
    a++;
    NSUserDefaults *ud = [[NSUserDefaults alloc] initWithSuiteName:@"group.willard.shareTest"];
    NSString *string = [NSString stringWithFormat:@"%@ %d", _inputTextField.text, a];
    [ud setObject:string forKey:@"HappyShare"];
    [ud synchronize];
}

@end
