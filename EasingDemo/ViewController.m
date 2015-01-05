//
//  ViewController.m
//  EasingTestApp
//
//  Created by Takeru Chuganji on 1/5/15.
//  Copyright (c) 2015 hoppenichu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    __weak UIView *targetView[8];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    const CGFloat size = 30;
    const CGFloat spacing = 16;
    UIColor *const color = [UIColor redColor];
    
    for (int i = 0; i < sizeof(targetView) / sizeof(targetView[0]); i++) {
        CGRect frame = CGRectMake(0, 40 + (size + spacing) * i, size, size);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = color;
        [self.view addSubview:view];
        targetView[i] = view;
    }
}

- (IBAction)hc_startButtonAction:(id)sender {
    for (int i = 0; i < sizeof(targetView) / sizeof(targetView[0]); i++) {
        UIView *view = targetView[i];
        CGRect frame = view.frame;
        frame.origin.x = 0;
        view.frame = frame;
        
        [UIView animateWithDuration:3
                              delay:0
                            options:(UIViewAnimationOptions) (i << 16)
                         animations:^{
                             CGRect rect = view.frame;
                             rect.origin.x = CGRectGetWidth(view.superview.bounds) - CGRectGetWidth(view.bounds);
                             view.frame = rect;
                         }
                         completion:nil];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
