//
//  ViewController.m
//  PresentVC
//
//  Created by 冯攀 on 2019/12/20.
//  Copyright © 2019 冯攀. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+XPModal.h"
#import "ViewRightController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    XPModalConfiguration *configuration = [XPModalConfiguration defaultConfiguration];
    configuration.direction = XPModalDirectionCenter;
    configuration.enableInteractiveTransitioning = NO;
    configuration.autoDismissModal = NO;
    CGSize contentSize = CGSizeMake(200.0, CGFLOAT_MAX);
    
    ViewRightController *vc = [[ViewRightController alloc] init];
    
    //    [self presentModalWithView:vc.view contentSize:contentSize configuration:configuration completion:^{
    //
    //    }];
    [self presentModalWithViewController:vc contentSize:contentSize configuration:configuration completion:nil];
}


@end
