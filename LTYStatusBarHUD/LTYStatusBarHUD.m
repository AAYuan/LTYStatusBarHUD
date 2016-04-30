//
//  LTYStatusBarHUD.m
//  状态栏指示器
//
//  Created by AYuan on 16/3/25.
//  Copyright © 2016年 AYuan. All rights reserved.
//

#import "LTYStatusBarHUD.h"

#define LTYMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间*/
static CGFloat const LTYMessageDuration = 2.0;
/** 消息的显示\隐藏的动画时间*/
static CGFloat const LTYAnimationDuration = 0.25;

@implementation LTYStatusBarHUD

/** 全局窗口*/
static UIWindow *window_;
/** 定时器*/
static NSTimer *timer_;

/** 显示窗口*/
+ (void)showWindow
{
    //frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //显示window
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.frame = frame;
    
    //执行窗口
    frame.origin.y = 0;
    [UIView animateWithDuration:LTYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


/**
 * 显示普通信息
 * @param msg    文字
 * @param image  图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    //显示window
    [self showWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    if (image) { //如果有图片
        [button setImage:image forState:UIControlStateNormal];
        [button setTitle:msg forState:UIControlStateNormal];
    }
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [window_ addSubview:button];
    
    //定时器(调用定时器的schedule方法会自动添加到runloop中去并启动)
    [NSTimer scheduledTimerWithTimeInterval:LTYMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**显示普通信息*/
+ (void)showMessage:(NSString *)msg
{
    //显示window
    [self showWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setImage:[UIImage imageNamed:@"LTYStatusBarHUD.bundle/success.png"] forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    [window_ addSubview:button];

}

/**
 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LTYStatusBarHUD.bundle/success.png"]];
    
}

/**
 显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LTYStatusBarHUD.bundle/sign_error_15.223300970874px_1185688_easyicon.net"]];

}

/**
 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = LTYMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : LTYMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/**
 隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:LTYAnimationDuration animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
        
    }];
    
}



@end
