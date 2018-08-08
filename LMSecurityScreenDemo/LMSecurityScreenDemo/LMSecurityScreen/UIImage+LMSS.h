//
//  UIImage+LMSS.h
//  LMSecurityScreenDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LMSS)

/*
 1.白色,参数:
 透明度 0~1,  0为白,   1为深灰色
 半径:默认30,推荐值 3   半径值越大越模糊 ,值越小越清楚
 色彩饱和度(浓度)因子:  0是黑白灰, 9是浓彩色, 1是原色  默认1
 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 */
- (UIImage *)imgWithLightAlpha:(CGFloat)alpha
                        radius:(CGFloat)radius
         colorSaturationFactor:(CGFloat)colorSaturationFactor;
/*
 透明度 0
 半径:9
 色彩饱和度(浓度)因子:  1
 */
- (UIImage *)imgWithBlur;

@end
