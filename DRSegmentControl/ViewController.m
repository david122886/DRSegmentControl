//
//  ViewController.m
//  DRSegmentControl
//
//  Created by xxsy-ima001 on 14-5-28.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import "ViewController.h"
#import "DRSegmentControl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DRSegmentControl *control = [DRSegmentControl defaultFromNib];
    control.frame = (CGRect){0,20,320,44};
    control.delegate = self;
    [self.view addSubview:control];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark DRSegmentControlDelegate
-(void)drsegmentControl:(DRSegmentControl *)control didselectedAtIndex:(int)index{
    NSLog(@"drsegmentControl selected At index:%d",index);
}

#pragma mark --

@end
