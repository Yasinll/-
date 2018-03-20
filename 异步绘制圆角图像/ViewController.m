//
//  ViewController.m
//  异步绘制圆角图像
//
//  Created by PatrickY on 2017/12/26.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    iv.center = self.view.center;
    
    UIImage *image = [UIImage imageNamed:@"01.jpg"];
    [image pt_cornerImageWithSize:iv.bounds.size fillColor:[UIColor whiteColor] completed:^(UIImage *image) {
        
        iv.image = image;
        
    }];
    
    [self.view addSubview:iv];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
