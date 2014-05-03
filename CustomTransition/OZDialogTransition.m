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
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    CGRect presentedRect = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.frame = CGRectMake(0,
                                 -CGRectGetMaxY(presentedRect),
                                 CGRectGetWidth(toVC.view.frame),
                                 CGRectGetHeight(toVC.view.frame));
    
    [UIView animateWithDuration:animationDuration
                          delay:zeroDelayDuration
         usingSpringWithDamping:0.6f
          initialSpringVelocity:0.8f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.view.frame = CGRectMake(0,
                                                      0,
                                                      CGRectGetWidth(presentedRect),
                                                      CGRectGetHeight(presentedRect));
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3 animations:^{
                            toVC.view.backgroundColor = [UIColor colorWithWhite:0.45 alpha:0.9];
                         }];
                         [transitionContext completeTransition:YES];
                     }];
}

@end
