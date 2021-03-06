//
//  OZLoginViewController.m
//  CustomTransition
//
//  Created by Kiattisak Anoochitarom on 4/29/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "OZLoginViewController.h"
#import "OZDialogTransition.h"

@interface OZLoginViewController () <OZDialogTransitionDataSource>

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

@property (nonatomic, strong) IBOutlet UIView *containerView;

- (IBAction)login:(id)sender;

@end

@implementation OZLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.emailField becomeFirstResponder];
    
    self.containerView.clipsToBounds = YES;
    self.containerView.layer.cornerRadius = 10.0;
}

#pragma mark - Action

- (IBAction)login:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - OZDialogTransitionDataSource

- (UIView *)loginDialog {
    return self.containerView;
}

@end
