//
//  UIImage+Extension.h
//  异步绘制圆角图像
//
//  Created by PatrickY on 2017/12/26.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (void)pt_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completed:(void(^)(UIImage *image))comletion;

@end
