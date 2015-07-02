//
//  ZLRandomVerifyCodeView.h
//  Pods
//
//  Created by ZhuShouyu on 7/2/15.
//
//

#import <UIKit/UIKit.h>

@interface ZLRandomVerifyCodeView : UIView

@property (nonatomic) NSUInteger numberOfLines;              //多少条随机线,默认值是0

@property (nonatomic, strong) NSArray *charaterSource;      //数据源,暂时只支持字符串

@property (nonatomic) NSUInteger numberOfCharactersToShow;  //随机多少个元素

@property (nonatomic, readonly, strong) NSString *currentRandomCharacters;      //当前随机的数据源

/**
 *  刷新验证码
 */
- (void)resetRandomCharacters;
@end
