//
//  ViewController.m
//  PresentVC
//
//  Created by 冯攀 on 2019/12/20.
//  Copyright © 2019 冯攀. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SPEACING 10

#import "ViewController.h"
#import "UIViewController+XPModal.h"
#import "ViewRightController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"中心", @"上弹", @"右弹", @"下弹", @"左弹"];
    

    float W = (SCREEN_WIDTH-SCREEN_SPEACING)/3-SCREEN_SPEACING;
    float H = 50.0;

    for (int i = 0; i < titleArray.count; i++) {
        float X = SCREEN_SPEACING+i%3*(W+SCREEN_SPEACING);
        float Y = 100 + floorf(i/3.0)*(H+SCREEN_SPEACING);
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btn];
        btn.tag = i;
        btn.frame = CGRectMake(X, Y, W, H);
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateHighlighted];
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.lightGrayColor forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[self setNavColor:UIColor.orangeColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[self setNavColor:UIColor.brownColor] forState:UIControlStateHighlighted];

        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (UIImage *)setNavColor:(UIColor *)color{
    //位图大小
    CGSize size = CGSizeMake(1, 1);
    //绘制位图
    UIGraphicsBeginImageContext(size);
    //获取当前创建的内容
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //充满指定的填充色
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    //充满指定的矩形
    CGContextFillRect(contextRef, CGRectMake(0, 0, 1, 1));
    //绘制image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //结束绘制/Users/ZCY/Desktop/NavigationDiv
    UIGraphicsEndImageContext();
    return image;
}

-(void)btnClick:(UIButton *)btn{
    XPModalConfiguration *configuration = [XPModalConfiguration defaultConfiguration];
    CGSize contentSize = CGSizeMake(0.0, 0.0);
    if (btn.tag == 0) {
        configuration.direction = XPModalDirectionCenter;
        configuration.enableInteractiveTransitioning = NO;
        configuration.autoDismissModal = YES;
        contentSize = CGSizeMake(0.7*SCREEN_WIDTH, 0.7*SCREEN_HEIGHT);
    }else if (btn.tag == 1){
        configuration.direction = XPModalDirectionTop;
        configuration.enableInteractiveTransitioning = NO;
        configuration.autoDismissModal = YES;
        contentSize = CGSizeMake(SCREEN_WIDTH, 300.0);
    }else if (btn.tag == 2){
        configuration.direction = XPModalDirectionRight;
        configuration.enableInteractiveTransitioning = NO;
        configuration.autoDismissModal = YES;
        contentSize = CGSizeMake(200.0, CGFLOAT_MAX);
    }else if (btn.tag == 3){
        configuration.direction = XPModalDirectionBottom;
        configuration.enableInteractiveTransitioning = NO;
        configuration.autoDismissModal = YES;
        contentSize = CGSizeMake(SCREEN_WIDTH, 300.0);
    }else if (btn.tag == 4){
        configuration.direction = XPModalDirectionLeft;
        configuration.enableInteractiveTransitioning = NO;
        configuration.autoDismissModal = YES;
        contentSize = CGSizeMake(200.0, CGFLOAT_MAX);

    }

    ViewRightController *vc = [[ViewRightController alloc] init];
    [self presentModalWithViewController:vc contentSize:contentSize configuration:configuration completion:nil];

}


@end
