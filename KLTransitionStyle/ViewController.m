//
//  ViewController.m
//  KLTransitionStyle
//
//  Created by Leo Chang on 5/12/15.
//  Copyright (c) 2015 SpringHouse Entertainment Inc. All rights reserved.
//

#import "ViewController.h"
#import "MaterialTransition.h"
#import "PresentedView.h"
#import "PresentCollectionView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic) MaterialTransition *transition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mrak - Transition
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"(%li, %li)", (long)indexPath.section, (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.transition = [[MaterialTransition alloc] initWithAnimatedView:cell];
    
    if (indexPath.row % 2 == 0)
    {
        PresentedView *controller = [PresentedView new];
        
        controller.modalPresentationStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        PresentCollectionView *controller = [[PresentCollectionView alloc] initWithNibName:@"PresentCollectionView" bundle:nil];
        
        controller.modalPresentationStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
    }
}

@end
