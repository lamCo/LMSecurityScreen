//
//  LMSecurityScreen.m
//  LAMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "LMSecurityScreen.h"
#import "LMSecurityImageView.h"
#import "UIImage+LMSS.h"

@implementation LMSecurityScreen
#pragma mark - public methods

// 获取主window
static inline UIWindow* ssGetWindow(void) {
    //获取keywindows
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //重新获取
    if (!window || ![window isMemberOfClass:[UIWindow class]]) {
        window = [UIApplication sharedApplication].windows[0];
    }
    return window;
}

+ (void)safeyScreenWithImage:(UIImage *)image
{
    if (!image) {
        image = [self getSnapshotImage];
    }
    
    // 容错先移除
    [self removeSafeyScreen];
    
    // 生成屏保添加
    UIImage *blurImage = [image imgWithBlur];
    
    LMSecurityImageView *safeImageView = [[LMSecurityImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    safeImageView.image = blurImage;
    safeImageView.tag = KSecurityScreenViewTag;
    
    // 添加到window
    UIWindow *window = ssGetWindow();
    [window addSubview:safeImageView];
    [window bringSubviewToFront:safeImageView];
}

// 移除屏保
+ (void)removeSafeyScreen {
    
    UIWindow *window = ssGetWindow();
    
    // 通过tag值查找
    LMSecurityImageView *imageView = [window viewWithTag:KSecurityScreenViewTag];
    
    if (imageView) {
        [imageView removeFromSuperview];
        imageView = nil;
    } else {
        /// 容错
        for (imageView in window.subviews) {
            if ([imageView isKindOfClass:[LMSecurityScreen class]]) {
                [imageView removeFromSuperview];
                imageView = nil;
            }
        }
    }
}

// 截图
+ (UIImage *)getSnapshotImage {
    @autoreleasepool {
        UIWindow *window = ssGetWindow();
        CGFloat scale = [UIScreen mainScreen].scale;
        // YES： 不透明
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, scale);
        
        if (@available(iOS 9.0, *)) {
            // YES 在window上视图都加载完成后 绘制图形
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        } else {
            [window.layer renderInContext:UIGraphicsGetCurrentContext()];
        }
        
        UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshot;
    }
}

@end
