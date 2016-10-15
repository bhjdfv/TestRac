//
//  BaseUseController.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "BaseUseController.h"
#import "TargetActionVc.h"

@implementation BaseUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本使用";
    self.contentArr = @[@"target-action",@"代理",@"通知"];    
}

#pragma mark - TableView Delegate
// 选中某单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TargetActionVc *vc = [[TargetActionVc alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
