//
//  UIColor+ZLColorCategory.m
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import "UIColor+ZLColorCategory.h"

@implementation UIColor(ZLColorCategory)

/**
 *  16进制转换成color
 *
 *  @param rgbValue 字体的颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)zl_colorWithHexString:(unsigned int)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}
@end
