//
//  NSString+AttributedString.h
//  EmptyNotice
//
//  Created by Spring on 2018/4/11.
//  Copyright © 2018年 MOKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (AttributedString)
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font;

- (CGFloat)heightWithLineSpacing:(CGFloat)lineSpacing width:(CGFloat)width fontSize:(CGFloat)fontSize;
@end
