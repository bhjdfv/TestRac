//
//  MainController.h
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTbv;

@property (nonatomic, strong) NSArray *contentArr;

@end
