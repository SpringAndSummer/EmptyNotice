//
//  NormalViewController.m
//  EmptyNotice
//
//  Created by Spring on 2018/4/11.
//  Copyright © 2018年 MOKO. All rights reserved.
//

#import "NormalViewController.h"
#import "UIView+EmptyNotice.h"
@interface NormalViewController ()

@end

@implementation NormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"普通页面空白图";

    [self.view showEmptyNotice:EmptyNoticeTypeNoData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
