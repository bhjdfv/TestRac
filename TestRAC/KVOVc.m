//
//  KVOVc.m
//  TestRAC
//
//  Created by 黄鑫 on 16/10/17.
//  Copyright © 2016年 Zhanqi. All rights reserved.
//

#import "KVOVc.h"

@interface KVOVc ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tbv;

@property (nonatomic, strong) UILabel *lb;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

static NSString *ID = @"UITableViewCellIDID";

@implementation KVOVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tbv];
    [self.view addSubview:self.lb];
    
    __weak typeof(self) ws = self;
    [RACObserve(self.tbv, contentOffset) subscribeNext:^(id x) {
        ws.lb.text = [NSString stringWithFormat:@"偏移量 = %f",ws.tbv.contentOffset.y];
    }];
}

- (NSMutableArray *)dataArr {
    // 懒加载
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
        for (int i=0; i<30; i++) {
            NSString *str = [NSString stringWithFormat:@"第%d条数据",i];
            [_dataArr addObject:str];
        }
    }
    return _dataArr;
}

- (UILabel *)lb {
    // 懒加载
    if (!_lb) {
        _lb = [[UILabel alloc] init];
        _lb.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
        _lb.textAlignment = NSTextAlignmentCenter;
        _lb.backgroundColor = [UIColor grayColor];
    }
    return _lb;
}

- (UITableView *)tbv {
    // 懒加载
    if (!_tbv) {
        _tbv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 40.f) style:UITableViewStylePlain];
        _tbv.dataSource = self;
        _tbv.rowHeight = 44;
        [_tbv registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    }
    return _tbv;
}

#pragma mark - TableView DataSource
// 一共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 每组多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

// 每行是什么cell
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (indexPath.row < self.dataArr.count) {
        cell.textLabel.text = self.dataArr[indexPath.row];
    }
    return cell;
}

@end
