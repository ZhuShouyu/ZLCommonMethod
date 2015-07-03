//
//  ZLCommonHUD.m
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#import "ZLCommonHUD.h"
#import "MBProgressHUD.h"

static ZLCommonHUD *sharedInstanceHUD = nil;

@interface ZLCommonHUD ()

@property (nonatomic, strong) MBProgressHUD *mbProgressHUD;

@end

@implementation ZLCommonHUD

/**
 *  单例
 *
 *  @return 单例
 */
+ (instancetype)defaultInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstanceHUD = [[ZLCommonHUD alloc] init];
    });
    return sharedInstanceHUD;
}

- (id)init
{
    self = [super init];
    if (self) {
        UIViewController *viewController = [[UIApplication sharedApplication].delegate window].rootViewController;
        _mbProgressHUD = [[MBProgressHUD alloc] initWithView:viewController.view];
    }
    
    return self;
}

/**
 *  显示一个演示一下就消失的视图
 *
 *  @param message 显示的信息
 */
- (void)showMessage:(NSString *)message {
    
    [self showMessage:message withHud:NO];
    
}

/**
 *  显示加载框，默认展示信息:加载中，请稍候。。。
 *
 *  @param view 在什么界面上展示
 */
- (void)loadingInView:(UIView *)view {
    
    [self loadingInView:view withText:@"加载中，请稍候..."];
    
}

/**
 *  指定提示性信息加载框
 *
 *  @param view 在什么界面上展示
 *  @param text 指定的加载信息
 */
- (void)loadingInView:(UIView *)view withText:(NSString *)text {
    
    self.mbProgressHUD.margin = 20.f;
    self.mbProgressHUD.labelText = text;
    self.mbProgressHUD.detailsLabelText = @"";
    self.mbProgressHUD.mode = MBProgressHUDModeIndeterminate;
    self.mbProgressHUD.yOffset = 0.f;
    
    [view addSubview:self.mbProgressHUD];
    [self.mbProgressHUD show:YES];
    
}

/**
 *  隐藏弹出框
 *
 *  @param view 从某个界面上隐藏
 */
- (void)hideFromView:(UIView *)view {
    
    [MBProgressHUD hideHUDForView:view animated:YES];
    
}

/**
 *  弹出框
 *
 *  @param message 提示性信息
 *  @param flag    是否长时间显示
 */
- (void)showMessage:(NSString *)message withHud:(BOOL)flag {
    
    if (!flag) {
        [[[UIApplication sharedApplication] delegate].window addSubview:self.mbProgressHUD];
        [self.mbProgressHUD show:YES];
    }
    self.mbProgressHUD.mode = MBProgressHUDModeText;
    self.mbProgressHUD.labelText = @"";
    self.mbProgressHUD.detailsLabelText = message;
    self.mbProgressHUD.margin = 10.f;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        
        self.mbProgressHUD.yOffset = 80.f;
        
    }
    else {
//        if (IPHONE5) {
//            self.mbProgressHUD.yOffset = 200.f;
//        }
//        else {
//            self.mbProgressHUD.yOffset = 150.f;
//        }
    }
    
    
    
    self.mbProgressHUD.removeFromSuperViewOnHide = YES;
    [self.mbProgressHUD hide:YES afterDelay:2.f];
}

@end
