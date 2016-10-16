//
//  ViewC.h
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "BaseView.h"
@class RACSubject;
@interface ViewC : BaseView

@property (nonatomic, strong) RACSubject *signal;

@end
