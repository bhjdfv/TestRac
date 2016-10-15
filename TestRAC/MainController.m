//
//  MainController.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/15.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "MainController.h"
#import "BaseUseController.h"

@interface MainController ()

@end

static NSString *UITableViewCellID = @"UITableViewCellID";

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RAC 使用";
    [self setupUI];
}

- (NSArray *)contentArr {
    // 懒加载
    if (!_contentArr) {
        _contentArr = @[@"基本使用",@"基础组件"];
    }
    return _contentArr;
}

- (UITableView *)mainTbv {
    // 懒加载
    if (!_mainTbv) {
        _mainTbv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTbv.backgroundColor = [UIColor whiteColor];
        _mainTbv.delegate = self;
        _mainTbv.dataSource = self;
        _mainTbv.rowHeight = 44.f;
        [_mainTbv registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
    }
    return _mainTbv;
}

- (void)setupUI {
    [self.view addSubview:self.mainTbv];
}

#pragma mark - TableView DataSource
// 一共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 每组多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentArr.count;
}

// 每行是什么cell
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
    if (indexPath.row < self.contentArr.count) {
        cell.textLabel.text = self.contentArr[indexPath.row];
    }
    return cell;
}

#pragma mark - TableView Delegate
// 选中某单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BaseUseController *vc = [[BaseUseController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
