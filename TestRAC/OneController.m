//
//  OneController.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/7.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "OneController.h"
#import <ReactiveCocoa.h>

@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];

//    __weak typeof(self) ws = self;
//    // 3.订阅信号,才会激活信号.
//    [self.siganl subscribeNext:^(id x) {
//        // block调用时刻：每当有信号发出数据，就会调用block.
//        NSLog(@"接收到数据:%@",x);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [ws dismissViewControllerAnimated:YES completion:nil];
//        });
//    }];
    
    if (self.siganl) {
        [self.siganl sendNext:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
