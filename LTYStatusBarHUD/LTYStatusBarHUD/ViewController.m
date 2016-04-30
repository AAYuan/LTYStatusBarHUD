//
//  ViewController.m
//  状态栏指示器
//
//  Created by AYuan on 16/3/25.
//  Copyright © 2016年 AYuan. All rights reserved.
//

#import "ViewController.h"
#import "LTYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success {
    [LTYStatusBarHUD showSuccess:@"成功"];
}

- (IBAction)error {
    [LTYStatusBarHUD showError:@"失败"];
}
- (IBAction)hide {
    [LTYStatusBarHUD hide];
}

- (IBAction)message {
    [LTYStatusBarHUD showMessage:@"没有什么信息"];
}

- (IBAction)showingLoding:(id)sender {
    
    [LTYStatusBarHUD showLoading:@"正在加载"];
}

@end
