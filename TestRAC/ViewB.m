//
//  ViewB.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/14.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        __weak typeof(self) ws = self;
        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"testNoti" object:nil] subscribeNext:^(NSNotification *notification) {
            NSLog(@"%@", notification.name);
            NSLog(@"%@", notification.object);
            
            NSDictionary *dict = notification.object;
            if (dict) {
                NSString *num = [[dict objectForKey:@"num"] stringValue];
                NSString *string = [NSString stringWithFormat:@"收到随机数 = %@",num];
                [ws refreshUI:string btnTitle:nil];
            }
        }];
    }
    return self;
}

- (void)btnClicked {
    [super btnClicked];
    NSLog(@"B Clicked");
}

@end
