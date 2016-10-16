//
//  ViewC.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "ViewC.h"

@implementation ViewC

- (void)btnClicked {
    [super btnClicked];
    if (self.signal) {
        [self.signal sendNext:nil];
    }
}

@end
