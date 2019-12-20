//
//  ViewRightController.m
//  TestVC
//
//  Created by fengpan on 2019/5/6.
//  Copyright © 2019 fengpan. All rights reserved.
//

#import "ViewRightController.h"

@interface ViewRightController ()

@end

@implementation ViewRightController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^(void) {
        //这里写你自己定义的动画
        NSLog(@"确定");
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"touchesBegan");

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
