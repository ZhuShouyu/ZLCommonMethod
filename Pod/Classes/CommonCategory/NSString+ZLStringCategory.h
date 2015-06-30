//
//  NSString+ZLStringCategory.h
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import <Foundation/Foundation.h>

/*@"身份证号码位数不对!",
 @"身份证号码出生日期超出范围或含有非法字符!",
 @"身份证号码校验错误!",
 @"身份证号码在地区处非法!"
 */
typedef NS_ENUM(NSInteger, ZLStringCategoryEnum) {
    ZLStringCategoryEnumIDCardRight,                                    //二代证验证成功
    ZLStringCategoryEnumWrongCount,                                     //二代证个数错误
    ZLStringCategoryEnumIDCardWrongBithDateOrIllegalCharacter,          //出生日期错误或者非法字符
    ZLStringCategoryEnumIDCardRegixWrong,                               //校验出错
    ZLStringCategoryEnumIDCardWrongZone,                                //区域错误
};

@interface NSString(ZLStringCategory)

/**
 *  判断是否是合法的手机号
 *
 *  @return 判断结果
 */
- (BOOL)zl_isMobilePhoneNumber;

/**
 *  是否是合法的二代身份证号码
 *
 *  @return 判断结果
 */
- (ZLStringCategoryEnum)zl_isValidIDCardNumber;

/**
 *  根据指定的正则表达式判断字符串是否符合要求
 *
 *  @param regix 正则
 *
 *  @return 判断结果
 */
- (BOOL)zl_isMatchedWithRegix:(NSString *)regix;
@end
