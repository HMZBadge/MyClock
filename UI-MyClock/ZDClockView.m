//
//  ZDClockView.m
//  UI-MyClock
//
//  Created by 赵志丹 on 15/10/30.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "ZDClockView.h"

@interface ZDClockView ()
@property (nonatomic,strong) CALayer *second;
@property (nonatomic,strong) CALayer *minute;
@property (nonatomic,strong) CALayer *hour;
@end

@implementation ZDClockView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)timeChange{
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSInteger second = [cal component:NSCalendarUnitSecond fromDate:date];
    self.second.AffineTransform = CGAffineTransformMakeRotation(2 * M_PI / 60 * second);
    
    NSInteger minute = [cal component:NSCalendarUnitMinute fromDate:date];
    self.minute.affineTransform = CGAffineTransformMakeRotation(2 * M_PI / 60 * minute);
    
    NSInteger hour = [cal component:NSCalendarUnitHour fromDate:date];
    self.hour.affineTransform = CGAffineTransformMakeRotation(2 * M_PI / 24 * hour);
}

- (void)setupUI {
    CALayer *clock = [[CALayer alloc] init];
    clock.frame = self.bounds;
    clock.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    clock.cornerRadius = MIN(self.bounds.size.width, self.bounds.size.height) * 0.5;
    clock.masksToBounds = YES;
    
    CALayer *second = [CALayer layer];
    second.position = clock.position;
    second.bounds = CGRectMake(0, 0, 1, clock.cornerRadius);
    second.backgroundColor = [UIColor redColor].CGColor;
    second.anchorPoint = CGPointMake(0.5, 0.8);
    self.second = second;
    
    CALayer *minute = [CALayer layer];
    minute.position = clock.position;
    minute.bounds = CGRectMake(0, 0, 2, clock.cornerRadius * 0.9);
    minute.backgroundColor = [UIColor blackColor].CGColor;
    minute.anchorPoint = CGPointMake(0.5, 0.8);
    self.minute = minute;
    
    CALayer *hour = [CALayer layer];
    hour.position = clock.position;
    hour.bounds = CGRectMake(0, 0, 4, clock.cornerRadius * 0.7);
    hour.backgroundColor = [UIColor blackColor].CGColor;
    hour.anchorPoint = CGPointMake(0.5, 0.8);
    self.hour = hour;
    
    
    [self.layer addSublayer:clock];
    [self.layer addSublayer:second];
    [self.layer addSublayer:minute];
    [self.layer addSublayer:hour];
}





@end
