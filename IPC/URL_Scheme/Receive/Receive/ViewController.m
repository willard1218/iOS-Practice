//
//  ViewController.m
//  Receive
//
//  Created by willard on 2017/1/17.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong) UITextField *inputTextField;
@property (strong) UIButton *confirmButton;
@end

const NSString *kOtherAppURLScheme = @"Send://";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 200, 30)];
    _inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    _inputTextField.font = [UIFont systemFontOfSize:15];
    _inputTextField.placeholder = @"enter text";
    _inputTextField.returnKeyType = UIReturnKeyDone;
    _inputTextField.delegate = self;
    
    
    _confirmButton =  [UIButton buttonWithType:UIButtonTypeSystem];
    _confirmButton.frame = CGRectMake(100,  100, 100, 60);
    [_confirmButton setTitle:@"Confirm" forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(confirmButtonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 300, 400)];
    _resultLabel.numberOfLines = 0;
    
    
    [self.view addSubview:_inputTextField];
    [self.view addSubview:_confirmButton];
    [self.view addSubview:_resultLabel];
}

- (void)confirmButtonDidPressed {
    [_inputTextField resignFirstResponder];
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:kOtherAppURLScheme]]) {
        
        NSString *queryStr = [_inputTextField.text stringByAddingPercentEncodingWithAllowedCharacters:
                              NSCharacterSet.URLQueryAllowedCharacterSet];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", kOtherAppURLScheme, queryStr]];
        NSDictionary *options = @{};
        [[UIApplication sharedApplication] openURL:url options:options completionHandler:^(BOOL success) {
            NSLog(@"open url %@ is %@", kOtherAppURLScheme, (success) ? @"successful" : @"failed");
        }];
    } else {
        NSLog(@"URL can't found");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _inputTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
