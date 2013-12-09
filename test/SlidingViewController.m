//
//  URSlidingViewController.m
//  Remote
//
//  Created by Richard Simko on 8/2/13.
//  Copyright (c) 2013 Unified Intents. All rights reserved.
//

#import "SlidingViewController.h"
#import "CustomNavController.h"

@implementation SlidingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CustomNavController *nav = [[CustomNavController alloc] initWithNibName:NSStringFromClass([CustomNavController class]) bundle:nil];
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
        //I know it's a bad solution but it's the best there is.
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 70000
#error Test this code before shipping
#endif
    if ([touch.view.superview.superview isKindOfClass:[UISwitch class]] || [touch.view isKindOfClass:[UISlider class]]){//Prevents activation on controls
        return NO;
    }
    if ([touch.view.superview.superview isKindOfClass:[UITableViewCell class]]) {
        return ((UITableViewCell *) touch.view.superview.superview).editingStyle == UITableViewCellEditingStyleNone;
    }
    UIView *touchView = touch.view;
    while (touchView.superview != nil) {
//        if ([touchView conformsToProtocol:@protocol(URNoSideMenu)]) {
//            return NO;
//        }
        touchView = touchView.superview;
    }
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //Prevents activation when scrolling in a tableview
    if([otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer.view isKindOfClass:[UITableView class]])
        return NO;
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
