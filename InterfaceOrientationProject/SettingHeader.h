//
//  SettingHeader.h
//  YXPOrientationDemo
//
//  Created by yuxuanpeng on 2018/5/27.
//  Copyright © 2018年 client. All rights reserved.
//

#ifndef SettingHeader_h
#define SettingHeader_h

//枚举 设置旋转方向
typedef enum : NSUInteger {
    Orientations_MaskAll=0,//支持所有的旋转
    Orientations_Portrait,
    Orientations_left,
    Orientations_right,
    Orientations_Landscape //横屏,包含左右横屏
} Orientations;

#endif /* SettingHeader_h */
