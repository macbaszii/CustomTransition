//
//  OZViewController.m
//  CustomTransition
//
//  Created by Kiattisak Anoochitarom on 4/29/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZViewController.h"

#import "OZLoginViewController.h"
#import "OZDialogTransition.h"

@interface OZViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) IBOutlet UILabel *label;

- (IBAction)showLoginDialog:(id)sender;

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
}

#pragma mark - Action

- (IBAction)showLoginDialog:(id)sender {
    OZLoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OZLoginViewController"];
    
    loginViewController.modalPresentationStyle = UIModalPresentationCustom;
    loginViewController.transitioningDelegate = self;
    
    [self presentViewController:loginViewController
                       animated:YES
                     completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    OZDialogTransition *transition = [[OZDialogTransition alloc] init];
    transition.presented = YES;
    
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    OZDialogTransition *transition = [[OZDialogTransition alloc] init];
    transition.presented = NO;
    
    return transition;
}

@end
