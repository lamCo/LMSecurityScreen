//
//  LMSecurityScreen.h
//  LAMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KSecurityScreenViewTag 99810

/// 屏幕保护类 防止双击home键，APP信息泄露（截屏等）
@interface LMSecurityScreen : UIView

/**
 *  @brief 显示屏保,image = nil, 会获取当前屏幕截图的高斯模糊。
 *
 *  @param image     要显示的屏保图片
 */

+ (void)safeyScreenWithImage:(UIImage *)image;

/**
 *  @brief 去除屏保
 */
+ (void)removeSafeyScreen;

@end
