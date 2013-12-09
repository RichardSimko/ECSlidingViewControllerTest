//
//  URWindow.m
//  Remote
//
//  Created by Rick on 2013-08-08.
//  Copyright (c) 2013 Unified Intents. All rights reserved.
//

#import "CustomWindow.h"

@implementation CustomWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
}

- (void)makeKeyAndVisible
{
    [super makeKeyAndVisible];
    NSLog(@"makeKeyAndVisible");
}

- (void)becomeKeyWindow
{
    [super becomeKeyWindow];
    NSLog(@"becomeKeyWindow");
    
}

- (void)makeKeyWindow
{
    [super makeKeyWindow];
    NSLog(@"makekeyWindow");
}

@end
