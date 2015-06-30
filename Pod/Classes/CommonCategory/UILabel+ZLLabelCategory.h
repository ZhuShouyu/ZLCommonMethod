//
//  UILabel+ZLLabelCategory.h
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import <UIKit/UIKit.h>

@interface UILabel(ZLLabelCategory)

/**
 *  类方法创建label
 *
 *  @param txt   文本
 *  @param color 文字颜色
 *  @param font  字体
 *
 *  @return 创建的label
 */
+ (UILabel *)zl_initWithText:(NSString *)txt textColor:(UIColor *)color textFont:(UIFont *)font ;

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
+ (UILabel *)zl_initWithFrame:(CGRect)frame text:(NSString *)txt textColor:(UIColor*)color textFont:(UIFont *)font;

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
+ (UILabel *)zl_initWithFrame:(CGRect)frame Text:(NSString *)txt TextColor:(UIColor*)color TextFont:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment;

@end
