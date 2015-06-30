//
//  UILabel+ZLLabelCategory.m
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import "UILabel+ZLLabelCategory.h"

@implementation UILabel(ZLLabelCategory)

/**
 *  类方法创建label
 *
 *  @param txt   文本
 *  @param color 文字颜色
 *  @param font  字体
 *
 *  @return 创建的label
 */
+ (UILabel *)zl_initWithText:(NSString *)txt textColor:(UIColor *)color textFont:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = txt;
    label.textColor = color;
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
    
}

/**
 *  类方法创建label
 *
 *  @param frame frame
 *  @param txt   文本
 *  @param color 文字颜色
 *  @param font  字体
 *
 *  @return 创建的label
 */
+ (UILabel *)zl_initWithFrame:(CGRect)frame text:(NSString *)txt textColor:(UIColor*)color textFont:(UIFont *)font {
    
    UILabel *label = [self zl_initWithText:txt textColor:color textFont:font];
    [label setNumberOfLines:0];
    label.userInteractionEnabled = NO;
    label.frame = frame;
    return label;
    
}

/**
 *  类方法创建label
 *
 *  @param frame frame
 *  @param txt   文本
 *  @param color 文字颜色
 *  @param font  字体
 *  @param textAlignment 字体排序
 *
 *  @return 创建的label
 */
+ (UILabel *)zl_initWithFrame:(CGRect)frame Text:(NSString *)txt TextColor:(UIColor*)color TextFont:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [self zl_initWithFrame:frame text:txt textColor:color textFont:font];
    label.textAlignment = textAlignment;
    return label;
    
}

@end
