//
//  YXPBaseViewController.h
//  YXPOrientationDemo
//
//  Created by yuxuanpeng on 2018/5/27.
//  Copyright © 2018年 client. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXPBaseViewController : UIViewController



/**
 创建Btn

 @param title 标题
 @param rect 坐标
 @param seletor 方法
 @return btn对象
 */
- (UIButton *_Nullable)customButtonWithTitle:(nonnull NSString *)title frame:(CGRect)rect seletor:(nonnull SEL)seletor;

/**
 设置旋转屏幕

 @param orientation 屏幕方向
 */
- (void)setInterfaceOrientation:(UIInterfaceOrientation )orientation;

@end
