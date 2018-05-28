//
//  YXPBaseViewController.m
//  YXPOrientationDemo
//
//  Created by yuxuanpeng on 2018/5/27.
//  Copyright © 2018年 client. All rights reserved.
//

#import "YXPBaseViewController.h"
#import "SettingHeader.h"

@interface YXPBaseViewController ()

@end

@implementation YXPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark customUI

- (UIButton *_Nullable)customButtonWithTitle:(nonnull NSString *)title frame:(CGRect)rect seletor:(nonnull SEL)seletor
{
    UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customBtn.frame = rect;
    [customBtn setTitle:title forState:UIControlStateNormal];
    customBtn.backgroundColor = [UIColor greenColor];
    [customBtn addTarget:self action:seletor forControlEvents:UIControlEventTouchUpInside];
    return customBtn;
}

#pragma mark setOrientations


/**第三步:base界面旋转开关控制,指定界面重新开关控制**/

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)prefersStatusBarHidden {
    
    return NO;
}

- (void)setInterfaceOrientation:(UIInterfaceOrientation )orientation
{
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_left) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            [self interfaceOrientation:orientation];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_right) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            [self interfaceOrientation:orientation];
            break;
        case UIInterfaceOrientationPortrait:
            [[NSUserDefaults standardUserDefaults]setObject:@(Orientations_Portrait) forKey:@"orientationLandscape"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            [self interfaceOrientation:orientation];
            break;
        default:
            break;
    }
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
