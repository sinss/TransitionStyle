//
//  PresentedView.m
//  KLTransitionStyle
//
//  Created by Leo Chang on 5/12/15.
//  Copyright (c) 2015 SpringHouse Entertainment Inc. All rights reserved.
//

#import "PresentedView.h"

@implementation PresentedView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:54./256. green:70./256. blue:93./256. alpha:1.];
    
    CGFloat y = 15;
    CGFloat width = 50;
    CGFloat height = width;
    CGFloat x = 15;
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    [closeButton setTitle:@"Done" forState:UIControlStateNormal];
    
    [closeButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:closeButton];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
