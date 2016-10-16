//
//  BaseUseController.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "BaseUseController.h"
#import "TargetActionVc.h"
#import "DelegateVc.h"
#import "NotiVc.h"
#import "KVOVc.h"

@implementation BaseUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本使用";
    self.contentArr = @[@"封装事件",@"代理",@"通知",@"KVO"];
}

#pragma mark - TableView Delegate
// 选中某单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [[TargetActionVc alloc] init];
            break;
        case 1:
            vc = [[DelegateVc alloc] init];
            break;
        case 2:
            vc = [[NotiVc alloc] init];
            break;
        case 3:
            vc = [[KVOVc alloc] init];
            break;
        default:
            break;
    }
    vc.title = self.contentArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
