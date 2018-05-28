//
//  FirstViewController.m
//  YXPOrientationDemo
//
//  Created by yuxuanpeng on 2018/5/27.
//  Copyright © 2018年 client. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()
@property (nonatomic, assign) UIInterfaceOrientation  curOrientation;

@end

@implementation FirstViewController

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *scapeLeftBtn = [self customButtonWithTitle:@"左横屏" frame:CGRectMake(100, 200, 80, 30) seletor:@selector(interfaceOrientationLeft)];
    UIButton *scapeRightBtn = [self customButtonWithTitle:@"右横屏" frame:CGRectMake(100, 260, 80, 30) seletor:@selector(interfaceOrientationRight)];
    UIButton *scapePortraitBtn = [self customButtonWithTitle:@"竖屏" frame:CGRectMake(100, 320, 80, 30) seletor:@selector(interfaceOrientationPortrait)];
    [self.view addSubview:scapeLeftBtn];
    [self.view addSubview:scapeRightBtn];
    [self.view addSubview:scapePortraitBtn];

    // Do any additional setup after loading the view.
}
//当界面销毁的时候  屏幕恢复
-(void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
    [self setInterfaceOrientation:UIInterfaceOrientationPortrait];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark BtnEvent

/*******第四步:设置状态栏,修改app支持的旋转方向******/

- (void)interfaceOrientationLeft
{
    [self setInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
}

- (void)interfaceOrientationRight
{
    [self setInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
}

- (void)interfaceOrientationPortrait
{
    [self setInterfaceOrientation:UIInterfaceOrientationPortrait];
}


#pragma mark settingSystem

/**第三步**在需要旋转的控制器设置****/

- (BOOL)prefersStatusBarHidden {
    
    return NO;
    
}//状态栏设置不隐藏

- (BOOL)shouldAutorotate
{
    return YES;
    
}//是否支持旋转

- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    return UIInterfaceOrientationMaskAll;
}//旋转方向


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
