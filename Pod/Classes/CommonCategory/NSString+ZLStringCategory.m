//
//  NSString+ZLStringCategory.m
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import "NSString+ZLStringCategory.h"

@implementation NSString(ZLStringCategory)

/**
 *  判断是否是合法的手机号
 *
 *  @return 判断结果
 */
- (BOOL)zl_isMobilePhoneNumber
{
    BOOL result = YES;
    NSString *regularString = @"^(1[0-9])\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularString];
    result = [predicate evaluateWithObject:self];
    return result;
}

/**
 *  是否是合法的二代身份证号码
 *
 *  @return 判断结果
 */
- (ZLStringCategoryEnum)zl_isValidIDCardNumber
{
    NSDictionary *area = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"北京",@"11",@"天津",@"12",@"河北",@"13",@"山西",@"14",@"内蒙古",@"15",//华北
                          @"辽宁",@"21",@"吉林",@"22",@"黑龙江",@"23",//东北
                          @"上海",@"31",@"江苏",@"32",@"浙江",@"33",@"安徽",@"34",@"福建",@"35",@"江西",@"36",@"山东",@"37",//华东
                          @"河南",@"41",@"湖北",@"42",@"湖南",@"43",@"广东",@"44",@"广西",@"45",@"海南",@"46",@"重庆",//中南
                          @"50",@"四川",@"51",@"贵州",@"52",@"云南",@"53",@"西藏",@"54",//西南
                          @"陕西",@"61",@"甘肃",@"62",@"青海",@"63",@"宁夏",@"64",@"新疆",@"65",//西北
                          @"台湾",@"71",@"香港",@"81",@"澳门",@"82",@"国外",@"91", nil];
    if (![area objectForKey:[self substringToIndex:2]]) {
        return ZLStringCategoryEnumIDCardWrongZone;
    }
    NSString *ereg = nil;
    if ([self length] == 15) {
        ereg = @"^\\d{15}";
        if (![self zl_isMatchedWithRegix:ereg]){
            return ZLStringCategoryEnumIDCardWrongBithDateOrIllegalCharacter;
        }
        NSString *birthday = [NSString stringWithFormat:@"19%@",[self substringWithRange:NSMakeRange(6,6)]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMdd";
        NSDate *date = [formatter dateFromString:birthday];
        if (date) {
            return ZLStringCategoryEnumIDCardRight;
        }else {
            return ZLStringCategoryEnumIDCardWrongBithDateOrIllegalCharacter;
        }
    }else if ([self length] == 18) {
        ereg = @"^\\d{17}[0-9xX]{1}$";
        if (![self zl_isMatchedWithRegix:ereg]){
            return ZLStringCategoryEnumIDCardWrongBithDateOrIllegalCharacter;
        }
        NSString *birthday = [self substringWithRange:NSMakeRange(6,8)];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMdd";
        NSDate *date = [formatter dateFromString:birthday];
        
        NSMutableArray *idCards = [NSMutableArray array];;
        for (int i = 0; i < 18; i++) {
            [idCards addObject:[self substringWithRange:NSMakeRange(i, 1)]];
        }
        if(date){
            NSInteger S = ([[idCards objectAtIndex:0] intValue] + [[idCards objectAtIndex:10] intValue]) * 7
            + ([[idCards objectAtIndex:1] intValue] + [[idCards objectAtIndex:11] intValue]) * 9
            + ([[idCards objectAtIndex:2] intValue] + [[idCards objectAtIndex:12] intValue]) * 10
            + ([[idCards objectAtIndex:3] intValue] + [[idCards objectAtIndex:13] intValue]) * 5
            + ([[idCards objectAtIndex:4] intValue] + [[idCards objectAtIndex:14] intValue]) * 8
            + ([[idCards objectAtIndex:5] intValue] + [[idCards objectAtIndex:15] intValue]) * 4
            + ([[idCards objectAtIndex:6] intValue] + [[idCards objectAtIndex:16] intValue]) * 2
            + [[idCards objectAtIndex:7] intValue] * 1
            + [[idCards objectAtIndex:8] intValue] * 6
            + [[idCards objectAtIndex:9] intValue] * 3 ;
            NSInteger Y = S % 11;
            NSString *JYM = @"10X98765432";
            NSString *M = [JYM substringWithRange:NSMakeRange(Y,1)];
            if([[M uppercaseString] isEqualToString:[[idCards objectAtIndex:17] uppercaseString]])
                return ZLStringCategoryEnumIDCardRight;
            else
                return ZLStringCategoryEnumIDCardRegixWrong;
        }
        else {
            return ZLStringCategoryEnumIDCardWrongBithDateOrIllegalCharacter;
        }
    } else {
        return ZLStringCategoryEnumWrongCount;
    }
}

/**
 *  根据指定的正则表达式判断字符串是否符合要求
 *
 *  @param regix 正则
 *
 *  @return 判断结果
 */
- (BOOL)zl_isMatchedWithRegix:(NSString *)regix
{
    if (regix == nil)
    {
        return NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regix];
    return [predicate evaluateWithObject:self];
}
@end
