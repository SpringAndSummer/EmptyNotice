//
//  UIView+EmptyNotice.h
//  mobileMOKO
//
//  Created by Spring on 2017/6/22.
//  Copyright © 2017年 moko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EmptyNoticeType) {
    EmptyNoticeTypeSearch = 0,   //搜索无结果空白页面
    EmptyNoticeTypeNoData,       //无数据空白页面
};

@interface UIView (EmptyNotice)

- (void)showEmptyNotice:(EmptyNoticeType)type;

- (void)removeEmptyNotice;

- (void)configureEmptyNoticeForDataSource:(NSArray *)dataSource type:(EmptyNoticeType)type;

@end
