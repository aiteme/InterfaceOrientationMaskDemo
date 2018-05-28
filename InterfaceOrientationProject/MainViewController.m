//
//  MainViewController.m
//  YXPOrientationDemo
//
//  Created by yuxuanpeng on 2018/5/27.
//  Copyright © 2018年 client. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *scapePushBtn = [self customButtonWithTitle:@"点击进入屏幕旋转测试界面" frame:CGRectMake(20, 200, 300, 40) seletor:@selector(pushView)];
    [self.view addSubview:scapePushBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushView
{
    FirstViewController *firstView = [[FirstViewController alloc]init];
    firstView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:firstView animated:YES];
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
