//
//  ZLCommonHUD.h
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZLCommonHUD : NSObject

/**
 *  单例
 *
 *  @return 单例
 */
+ (instancetype)defaultInstance;

/**
 *  显示一个演示一下就消失的视图
 *
 *  @param message 显示的信息
 */
- (void)showMessage:(NSString *)message;

/**
 *  显示加载框，默认展示信息:加载中，请稍候。。。
 *
 *  @param view 在什么界面上展示
 */
- (void)loadingInView:(UIView *)view;

/**
 *  指定提示性信息加载框
 *
 *  @param view 在什么界面上展示
 *  @param text 指定的加载信息
 */
- (void)loadingInView:(UIView *)view withText:(NSString *)text;

/**
 *  隐藏弹出框
 *
 *  @param view 从某个界面上隐藏
 */
- (void)hideFromView:(UIView *)view;

/**
 *  弹出框
 *
 *  @param message 提示性信息
 *  @param flag    是否长时间显示
 */
- (void)showMessage:(NSString *)message withHud:(BOOL)flag;

@end
