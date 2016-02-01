//
//  RootViewController.m
//  ARSafariActivityDemo
//
//  Created by Alex Ruperez on 19/10/13.
//  Copyright (c) 2013 Alex Ruperez. All rights reserved.
//

#import "RootViewController.h"
#import "ARSafariActivity.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIButton *showActivitiesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[showActivitiesButton setTitle:NSLocalizedString(@"Show Activities", @"Show Activities button") forState:UIControlStateNormal];
	[showActivitiesButton addTarget:self action:@selector(showActivities:) forControlEvents:UIControlEventTouchUpInside];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
	[showActivitiesButton setFrame:CGRectMake((screenSize.width/2)-100, (screenSize.height/2)-30, 200, 60)];
    [self.view addSubview:showActivitiesButton];
}

- (void)showActivities:(UIButton *)button
{
	NSURL *url = [NSURL URLWithString:@"http://alexruperez.com"];
	
	ARSafariActivity *safariActivity = [[ARSafariActivity alloc] init];
	
	UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:@[safariActivity]];
    
    if ([activityVC respondsToSelector:@selector(popoverPresentationController)])
    {
        activityVC.popoverPresentationController.sourceView = button;
        activityVC.popoverPresentationController.sourceRect = button.bounds;
    }
	
	[self presentViewController:activityVC animated:YES completion:nil];
}

@end
