//
//  URNavController.m
//  Remote
//
//  Created by Richard Simko on 8/2/13.
//  Copyright (c) 2013 Unified Intents. All rights reserved.
//

#import "CustomNavController.h"
#import "ECSlidingViewController.h"
#import "LeftMenuController.h"
#import "LeftMenuController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "ECSlidingConstants.h"
#import "ViewController.h"

@interface CustomNavController ()

@property (nonatomic, retain) UIBarButtonItem *menuButton;

@end

@implementation CustomNavController

-(void)menuTap
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuButton = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(menuTap)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self pushViewController:[[ViewController alloc] initWithNibName:NSStringFromClass([ViewController class]) bundle:nil] animated:YES];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.topViewController.navigationItem.leftBarButtonItem = self.menuButton;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuController class]]) {
        self.slidingViewController.underLeftViewController = [[LeftMenuController alloc] initWithNibName:NSStringFromClass([LeftMenuController class]) bundle:nil];
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
        self.slidingViewController.anchorRightRevealAmount = 220.0f;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    self.topViewController.navigationItem.leftBarButtonItem = self.menuButton;
}

@end
