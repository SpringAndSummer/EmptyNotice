//
//  TableViewViewController.m
//  EmptyNotice
//
//  Created by Spring on 2018/4/11.
//  Copyright © 2018年 MOKO. All rights reserved.
//

#import "TableViewViewController.h"
#import "UIView+EmptyNotice.h"
@interface TableViewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[];
    [self initUI];
}
- (void)initUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"列表页类空白图";
    self.view.backgroundColor = [UIColor whiteColor];
    self.listView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.listView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.listView.rowHeight = 50;
    self.listView.delegate = self;
    self.listView.dataSource = self;
    [self.listView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.listView];
    
    [self.listView configureEmptyNoticeForDataSource:self.dataArray type:EmptyNoticeTypeSearch];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
