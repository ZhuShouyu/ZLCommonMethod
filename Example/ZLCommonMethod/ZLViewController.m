//
//  ZLViewController.m
//  ZLCommonMethod
//
//  Created by Siam on 06/30/2015.
//  Copyright (c) 2014 Siam. All rights reserved.
//

#import "ZLViewController.h"
#import <ZLCommonMethod/ZLPlaceholderTextView.h>

@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLPlaceholderTextView *textView = [[ZLPlaceholderTextView alloc] initWithFrame:self.view.frame];
    textView.placeholder = @"hello wprld";
    [self.view addSubview:textView];
//    ZLRandomVerifyCodeView *view = [[ZLRandomVerifyCodeView alloc] initWithFrame:CGRectMake(20, 20, CGRectGetWidth(self.view.frame) - 40, 40)];
//    [view setBackgroundColor:[UIColor blueColor]];
//    
//    [self.view addSubview:view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
