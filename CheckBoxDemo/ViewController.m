//
//  ViewController.m
//  CheckBoxDemo
//
//  Created by line0 on 13-6-9.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "ViewController.h"
#import "CheckBoxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.checkboxes = [[NSMutableArray alloc] initWithCapacity:10];
    
    CheckBoxView *cbv = nil;
    CGRect frame = CGRectMake(20, 20, 240, 30);
    for (int i = 0; i < 10; ++i)
    {
        CheckBoxViewStyle style = (i % kCheckBoxViewStylesCount);
        BOOL checked = (i < 5);
        cbv = [[CheckBoxView alloc] initWithFrame:frame style:style checked:checked];
        [cbv setText:[NSString stringWithFormat:@"Option #%02d", (i + 1)]];
        [self.view addSubview:cbv];
        [self.checkboxes addObject:cbv];

        frame.origin.y += 36;
    }
    
    frame.origin.y += 24;
    cbv = [[CheckBoxView alloc] initWithFrame:frame  style:kCheckBoxViewStyleGlossy checked:YES];
    [cbv setText:@"Enable All"];
    
    [cbv addStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
    
    // handle state changed event using blocks
//    
//     __block typeof(self) me = self;
//     [cbv setStateChangedBlock:^(CheckBoxView *v)
//      {
//          [me checkBoxViewChangedState:v];
//     }];
    
    
    [self.view addSubview:cbv];
}

- (void)checkBoxViewChangedState:(CheckBoxView *)cbv
{
    NSLog(@"checkBoxViewChangedState: %d", cbv.checked);
    
    // toggle all
    for (CheckBoxView *cbv in self.checkboxes)
    {
        cbv.enabled = !cbv.enabled;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
