//
//  UIView+EmptyNotice.m
//  mobileMOKO
//
//  Created by Spring on 2017/6/22.
//  Copyright © 2017年 moko. All rights reserved.
//

#import "UIView+EmptyNotice.h"
#import "NSString+AttributedString.h"
#import <objc/runtime.h>
//#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//#define Is_Iphone_X (Is_Iphone && ScreenHeight == 812.0)
//#define NaviHeight (Is_Iphone_X ? 88 : 64)
static char kNoticeViewKey;

@implementation UIView (EmptyNotice)
- (NSString *)noticeImageNameForType:(EmptyNoticeType)type
{
    return @[@"Search-NotFound",
             @"not_zhuai_icon"
             ][type];
}

- (NSString *)noticeTextForType:(EmptyNoticeType)type
{
    return @[
             @"检索无结果",
             @"暂无数据"
             ][type];
}

- (void)showEmptyNotice:(EmptyNoticeType)type
{
    UIView *noticeView = objc_getAssociatedObject(self, &kNoticeViewKey);
    if (!noticeView)
    {
        noticeView = [[UIView alloc] initWithFrame:self.bounds];
        noticeView.backgroundColor = [UIColor clearColor];
        CGFloat noticeViewWidth = noticeView.frame.size.width;
        CGFloat noticeViewHeight = noticeView.frame.size.height;
        
        objc_setAssociatedObject(self, &kNoticeViewKey, noticeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        // imgNotice
        UIImageView *imgNotice = [[UIImageView alloc] init];
        NSString *imageStr = [self noticeImageNameForType:type];
        UIImage *image = [UIImage imageNamed:imageStr];
        imgNotice.image = image;
        imgNotice.frame = CGRectMake((noticeViewWidth - image.size.width) * 0.5, (noticeViewHeight - image.size.height) * 0.5 - 64, image.size.width, image.size.height);
        [noticeView addSubview:imgNotice];
        
        // labNotice
        UILabel *labNotice = [[UILabel alloc] init];
        labNotice.numberOfLines = 0;
        NSString *textStr = [self noticeTextForType:type];
        labNotice.attributedText = [textStr stringWithParagraphlineSpeace:5 textColor:[UIColor lightGrayColor] textFont:[UIFont systemFontOfSize:13]];
        CGFloat textStrHeight = [textStr heightWithLineSpacing:5 width:noticeViewWidth - 20 fontSize:13];
        labNotice.textAlignment = NSTextAlignmentCenter;
        labNotice.frame = CGRectMake(10, imgNotice.frame.origin.y + imgNotice.frame.size.height + 12, noticeViewWidth - 20, textStrHeight);
        [noticeView addSubview:labNotice];
        [self addSubview:noticeView];
    }
}

- (void)removeEmptyNotice
{
    UIView *noticeView = objc_getAssociatedObject(self, &kNoticeViewKey);
    if (noticeView)
    {
        [noticeView removeFromSuperview];
        objc_setAssociatedObject(self, &kNoticeViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)configureEmptyNoticeForDataSource:(NSArray *)dataSource type:(EmptyNoticeType)type
{
    if ([dataSource isKindOfClass:[NSArray class]])
    {
        if (dataSource.count > 0)
        {
            [self removeEmptyNotice];
        }
        else
        {
            [self showEmptyNotice:type];
        }
    }
}
@end
