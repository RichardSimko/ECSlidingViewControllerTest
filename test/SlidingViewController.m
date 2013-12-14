//
//  URSlidingViewController.m
//  Remote
//
//  Created by Richard Simko on 8/2/13.
//  Copyright (c) 2013 Unified Intents. All rights reserved.
//

#import "SlidingViewController.h"
#import "ViewController.h"

@implementation SlidingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationController *nav = [[UINavigationController alloc] initWithNibName:@"CustomNavController" bundle:nil];
        [nav pushViewController:[[ViewController alloc] initWithNibName:NSStringFromClass([ViewController class]) bundle:nil] animated:NO];
        self.topViewController = nav;
        self.topViewAnchoredGesture = (ECSlidingViewControllerAnchoredGesturePanning | ECSlidingViewControllerAnchoredGestureTapping);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.panGesture.delegate = self;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view.superview.superview isKindOfClass:[UITableViewCell class]]) {
        return ((UITableViewCell *) touch.view.superview.superview).editingStyle == UITableViewCellEditingStyleNone;
    }
    UIView *touchView = touch.view;
    while (touchView.superview != nil) {
        touchView = touchView.superview;
    }
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //Prevents activation when scrolling in a tableview
    if([otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer.view isKindOfClass:[UITableView class]] && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]){
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
