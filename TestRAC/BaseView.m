//
//  BaseView.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/14.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupSubviews];
    }
    return self;
}

- (void)refreshUI:(NSString *)title btnTitle:(NSString *)btnTitle {
    if (title) {
        self.titleLb.text = title;
    }
    if (btnTitle) {
        [self.btn setTitle:btnTitle forState:UIControlStateNormal];
    }
}

- (void)_setupSubviews {
    self.titleLb.frame = CGRectMake(0, 10, 200, 30);
    self.btn.frame = CGRectMake(0, 40, 200, 44);
}

- (UILabel *)titleLb {
    // 懒加载
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.text = @"标签";
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.backgroundColor = [UIColor redColor];
        [self addSubview:_titleLb];
    }
    return _titleLb;
}

- (UIButton *)btn {
    // 懒加载
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        _btn.backgroundColor = [UIColor greenColor];
        [_btn setTitle:@"按钮" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
    }
    return _btn;
}

- (void)btnClicked {
    NSLog(@"按钮被点了");
}

@end
