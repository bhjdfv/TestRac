//
//  BaseView.h
//  TestRAC
//
//  Created by 黄鑫 on 16/10/14.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

/** <#desc#>*/
@property (nonatomic, strong) UILabel *titleLb;

/** <#desc#>*/
@property (nonatomic, strong) UIButton *btn;

- (void)btnClicked;

- (void)refreshUI:(NSString *)title btnTitle:(NSString *)btnTitle;

@end
