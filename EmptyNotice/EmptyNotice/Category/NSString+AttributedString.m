//
//  NSString+AttributedString.m
//  EmptyNotice
//
//  Created by Spring on 2018/4/11.
//  Copyright © 2018年 MOKO. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font{
    if(self){
        // 设置段落
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpacing;
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        // NSKernAttributeName字体间距
        NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle};
        NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
        // 创建文字属性
        NSDictionary *attriBute = @{NSForegroundColorAttributeName:textcolor,NSFontAttributeName:font};
        [attriStr addAttributes:attriBute range:NSMakeRange(0, self.length)];
        return attriStr;
    }
    return nil;
}

- (CGFloat)heightWithLineSpacing:(CGFloat)lineSpacing width:(CGFloat)width fontSize:(CGFloat)fontSize{
    if(self){
        NSDictionary *attributeDic = nil;
        if (lineSpacing > 0){
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = lineSpacing;
            attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle};
        }else{
            attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
        }
        CGSize labelsize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil].size;
        return labelsize.height;
    }
    return 0;
}

@end
