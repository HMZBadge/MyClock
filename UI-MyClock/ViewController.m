//
//  ViewController.m
//  UI-MyClock
//
//  Created by 赵志丹 on 15/10/30.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "ViewController.h"
#import "ZDClockView.h"

@interface ViewController ()
@property (nonatomic,strong) ZDClockView *myClockView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    ZDClockView *myClock = [[ZDClockView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.myClockView = myClock;
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:myClock selector:@selector(timeChange)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [self.view addSubview: myClock];
}
@end
