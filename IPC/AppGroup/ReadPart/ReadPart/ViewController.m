//
//  ViewController.m
//  ReadPart
//
//  Created by willard on 2017/1/17.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 400)];
    _resultLabel.numberOfLines = 0;
    
    [self.view addSubview:_resultLabel];

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(readloop) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)readloop {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSUserDefaults *ud = [[NSUserDefaults alloc] initWithSuiteName:@"group.willard.shareTest"];
    NSString *string = [ud valueForKey:@"HappyShare"];
    _resultLabel.text = string;
}



@end
