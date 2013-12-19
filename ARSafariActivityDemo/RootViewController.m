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
	[showActivitiesButton setTitle:@"Show Activities" forState:UIControlStateNormal];
	[showActivitiesButton addTarget:self action:@selector(showActivities:) forControlEvents:UIControlEventTouchUpInside];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
	[showActivitiesButton setFrame:CGRectMake((screenSize.width/2)-60, (screenSize.height/2)-30, 120, 60)];
    [self.view addSubview:showActivitiesButton];
}

- (void)showActivities:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://alexruperez.com"];
	
	ARSafariActivity *safariActivity = [[ARSafariActivity alloc] init];
	
	UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:@[safariActivity]];
	
	[self presentViewController:activityVC animated:YES completion:nil];
}

@end
