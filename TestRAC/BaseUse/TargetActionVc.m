//
//  TargetActionVc.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "TargetActionVc.h"

@interface TargetActionVc ()

@property (nonatomic, strong) UILabel *lb;

@property (nonatomic, strong) UITextField *tf;

@property (nonatomic, strong) UIButton *btn;

@end

@implementation TargetActionVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.lb];
    [self.view addSubview:self.tf];
    [self.view addSubview:self.btn];
    
    __weak typeof(self) ws = self;
    // 文本变化消息
    [[self.tf rac_textSignal] subscribeNext:^(id x) {
        NSLog(@"text = %@",ws.tf.text);
        [self refreshUI:[self getTypeInState:ws.tf.text.length]];
    }];
    // 开始输入
    [[self.tf rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
        [self refreshUI:[self getTypeInState:ws.tf.text.length]];
    }];
    // 结束输入
    [[self.tf rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
        [ws refreshUI:TypeInStateEnd];
    }];
    // 按钮点击回调
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [ws.view endEditing:YES];
    }];
    // label加手势，
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        ws.lb.text = @"点我干啥";
    }];
    [self.lb addGestureRecognizer:tap];
    // label加手势，
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    [[tap1 rac_gestureSignal] subscribeNext:^(id x) {
        [ws.view endEditing:YES];
    }];
    [self.view addGestureRecognizer:tap1];
}

- (UILabel *)lb {
    // 懒加载
    if (!_lb) {
        _lb = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
        _lb.text = @"请输入";
        _lb.textColor = [UIColor blackColor];
        _lb.font = [UIFont systemFontOfSize:14.f];
        _lb.userInteractionEnabled = YES;
    }
    return _lb;
}

- (UITextField *)tf {
    // 懒加载
    if (!_tf) {
        _tf =[[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 44)];
        _tf.backgroundColor = [UIColor lightGrayColor];
    }
    return _tf;
}

- (UIButton *)btn {
    // 懒加载
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(100, 260, 200, 44);
        [_btn setTitle:@"提交" forState:UIControlStateNormal];
    }
    return _btn;
}

- (TypeInState )getTypeInState:(NSInteger)length {
    if (length == 0) {
        return TypeInStateEnd;
    } else if (length > 0 && length < 5){
        return TypeInStateInvaild;
    } else {
        return TypeInStateVaild;
    }
}

- (void)refreshUI:(TypeInState)state {

    switch (state) {
        case TypeInStateEnd:
            self.tf.backgroundColor = [UIColor lightGrayColor];
            self.btn.backgroundColor = [UIColor lightGrayColor];
            self.lb.textColor = [UIColor blackColor];
            self.lb.text = @"请输入文本";
            break;
        case TypeInStateVaild:
            self.tf.backgroundColor = [UIColor redColor];
            self.btn.backgroundColor = [UIColor greenColor];
            self.lb.textColor = [UIColor blackColor];
            self.lb.text = @"够了，可以发了。。";
            break;
        case TypeInStateInvaild:
            self.tf.backgroundColor = [UIColor yellowColor];
            self.btn.backgroundColor = [UIColor lightGrayColor];
            self.lb.textColor = [UIColor redColor];
            self.lb.text = @"不足5个字，不让发";
            break;
        default:
            break;
    }
}

//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}

@end
