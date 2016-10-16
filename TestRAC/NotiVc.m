//
//  NotiVc.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/17.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "NotiVc.h"
#import "ViewA.h"
#import "ViewB.h"

@interface NotiVc ()

@property (nonatomic, strong) ViewA *viewA;

@property (nonatomic, strong) ViewB *viewB;

@property (nonatomic, strong) UIButton *btn;

@end

@implementation NotiVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.viewA];
    [self.view addSubview:self.viewB];
    [self.view addSubview:self.btn];
    
    __weak typeof(self) ws = self;
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [ws createRandomNoti];
    }];
}

- (UIButton *)btn {
    // 懒加载
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        _btn.frame = CGRectMake(100, 400, 200, 44);
        _btn.backgroundColor = [UIColor greenColor];
        [_btn setTitle:@"发通知" forState:UIControlStateNormal];
    }
    return _btn;
}

- (void)createRandomNoti {
    NSInteger randomNum = arc4random_uniform(20);
    NSDictionary *dict = @{@"num" : @(randomNum)};
    NSNotification *noti = [NSNotification notificationWithName:@"testNoti" object:dict];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

- (ViewA *)viewA {
    // 懒加载
    if (!_viewA) {
        _viewA = [[ViewA alloc] initWithFrame:CGRectMake(100, 200, 200, 80)];
        _viewA.backgroundColor = [UIColor grayColor];
    }
    return _viewA;
}

- (ViewB *)viewB {
    // 懒加载
    if (!_viewB) {
        _viewB = [[ViewB alloc] initWithFrame:CGRectMake(100, 300, 200, 80)];
        _viewB.backgroundColor = [UIColor grayColor];
    }
    return _viewB;
}

@end
