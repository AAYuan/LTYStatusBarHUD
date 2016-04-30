# LTYStatusBarHUD

##Features【能做什么】

LTYStatusBarHUD is a very simple and ease to use StatusBar HUD framework.

LTYStatusBarHUD是一个显示状态指示栏的超轻量级框架。

Coding all properties of model in one line code.
只需要一行代码，就能实现状态指示栏的显示。

##LTYStatusBarHUD.h

```
/**
 * 显示普通信息
 * @param msg    显示文字
 * @param image  自定义图片,如果下面其他的接口则显示的是我提供的图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/** 显示普通信息*/
+ (void)showMessage:(NSString *)msg;

/** 显示成功信息*/
+ (void)showSuccess:(NSString *)msg;

/** 显示失败信息*/
+ (void)showError:(NSString *)msg;

/** 显示正在处理的信息*/
+ (void)showLoading:(NSString *)msg;

/** 隐藏*/
+ (void)hide;

```

##Installation【安装】

###From CocoaPods【使用CocoaPods】

pod 'LTYStatusBarHUD'

##Manually【手动导入】

Drag all source files under floder LTYStatusBarHUD to your project.【将LTYStatusBarHUD文件夹中的所有源代码拽入项目中】

Import the main header file：#import "LTYStatusBarHUD.h"【导入主头文件：#import "LTYStatusBarHUD.h"】



