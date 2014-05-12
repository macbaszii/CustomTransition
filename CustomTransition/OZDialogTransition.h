//
//  OZDialogTransition.h
//  CustomTransition
//
//  Created by Kiattisak Anoochitarom on 4/29/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OZDialogTransitionDataSource <NSObject>

- (UIView *)loginDialog;

@end

@interface OZDialogTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL presented;

@end
