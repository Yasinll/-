//
//  UIImage+Extension.m
//  异步绘制圆角图像
//
//  Created by PatrickY on 2017/12/26.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

-(void)pt_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completed:(void (^)(UIImage *image))comletion {
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        //建立图形上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        //填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        //裁切
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path addClip];
        
        //绘图
        [self drawInRect:rect];
        
        //取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭图形上下文
        UIGraphicsEndImageContext();
        
        //完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (comletion != nil) {
                comletion(result);
            }
        });
        
    });
    
}

@end
