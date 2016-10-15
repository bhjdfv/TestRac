//
//  DelegateVc.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "DelegateVc.h"
#import "ViewC.h"

@interface DelegateVc ()

@property (nonatomic, strong) ViewC *newView;

@end

@implementation DelegateVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.newView];
    __weak typeof(self) ws = self;
    // 给view增加信号和回调
    self.newView.signal = [RACSubject subject];
    [self.newView.signal subscribeNext:^(id x) {
        [ws showAlert];
    }];
}

- (ViewC *)newView {
    // 懒加载
    if (!_newView) {
        _newView = [[ViewC alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
        _newView.center = self.view.center;
    }
    return _newView;
}

- (void)showAlert {
    __weak typeof(self) ws = self;
    // 将代理方法的实现使用信号封装
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"RAC TEST" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"没意思", nil];
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
        // tuple.second 表示协议接口传出的第二个参数
        NSString *btnTitle = @"点击出弹窗";
        switch ([tuple.second integerValue]) {
            case 0:
                [ws.newView refreshUI:@"取消" btnTitle:btnTitle];
                break;
            case 1:
                [ws.newView refreshUI:@"确定" btnTitle:btnTitle];
                break;
            case 2:
                [ws.newView refreshUI:@"没意思" btnTitle:btnTitle];
                break;
            default:
                break;
        }
    }];
    [alertView show];
}

@end
