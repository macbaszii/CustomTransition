//
//  OZDialogTransition.m
//  CustomTransition
//
//  Created by Kiattisak Anoochitarom on 4/29/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZDialogTransition.h"

static CGFloat const animationDuration = 1.5f;
static CGFloat const zeroDelayDuration = 0.0f;

@implementation OZDialogTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController <OZDialogTransitionDataSource> *toVC = (UIViewController<OZDialogTransitionDataSource> *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *loginDialog = [toVC loginDialog];
    
    [[transitionContext containerView] addSubview:fromVC.view];
    [[transitionContext containerView] addSubview:toVC.view];
    
    CGRect endRect = loginDialog.frame;
    CGRect beginRect = endRect;
    beginRect.origin.y -= CGRectGetHeight(toVC.view.frame);
    loginDialog.frame = beginRect;
    
    [UIView animateWithDuration:animationDuration
                          delay:zeroDelayDuration
         usingSpringWithDamping:0.7f
          initialSpringVelocity:0.8f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.view.backgroundColor = [UIColor colorWithWhite:0.45 alpha:0.9];
                         loginDialog.frame = endRect;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
