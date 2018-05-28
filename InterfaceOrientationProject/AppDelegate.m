//
//  AppDelegate.m
//  InterfaceOrientationProject
//
//  Created by atme on 2018/5/28.
//  Copyright © 2018年 atme. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SettingHeader.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self createMainViewController];
    return YES;
}

- (void)createMainViewController
{
    //屏幕状态重置
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"orientationLandscape"];
    
    UITabBarController *mainTabbar =[[UITabBarController alloc]init];
    MainViewController *firstView = [[MainViewController alloc]init];
    
    //设置颜色图标等
    firstView.title=@"旋转";
    firstView.tabBarItem.title=@"旋转";
    
    //设置导航栏
    UINavigationController *nc =[[UINavigationController alloc]initWithRootViewController:firstView];
    nc.navigationBar.backgroundColor = [UIColor whiteColor];
    
    mainTabbar.viewControllers=@[nc];
    mainTabbar.selectedIndex=0;
    self.window.rootViewController = mainTabbar;
    
}

/******第二步:控制屏幕显示:******/
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    UIInterfaceOrientationMask  orientationMask  = UIInterfaceOrientationMaskPortrait;
    NSNumber *orientationnum  =[[NSUserDefaults standardUserDefaults]objectForKey:@"orientationLandscape"];
    if(orientationnum)
    {
        Orientations orientationStatus = [orientationnum integerValue];
        switch (orientationStatus) {
            case Orientations_MaskAll:
            {
                orientationMask = UIInterfaceOrientationMaskAll;
            }
                break;
            case Orientations_Portrait:
            {
                orientationMask = UIInterfaceOrientationMaskPortrait;
            }
                break;
            case Orientations_left:
            {
                orientationMask = UIInterfaceOrientationMaskLandscapeLeft;
            }
                break;
            case Orientations_right:
            {
                orientationMask = UIInterfaceOrientationMaskLandscapeRight;
            }
                break;
            case Orientations_Landscape:
            {
                orientationMask = UIInterfaceOrientationMaskLandscape;
            }
                break;
            default:
                orientationMask = UIInterfaceOrientationMaskPortrait;
                break;
        }
    }
    return orientationMask;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
