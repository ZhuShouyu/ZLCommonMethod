//
//  UIColor+ZLColorCategory.h
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import <UIKit/UIKit.h>

@interface UIColor(ZLColorCategory)

/**
 *  16进制转换成color
 *
 *  @param rgbValue 字体的颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)zl_colorWithHexString:(unsigned int)rgbValue;

@end
