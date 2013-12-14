//
//  ViewController.m
//  test
//
//  Created by Rick on 2013-12-09.
//  Copyright (c) 2013 Rick. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "LeftMenuController.h"
@interface ViewController ()

@property (nonatomic, retain) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.items  = @[@"asd", @"asd2", @"asd3", @"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",@"asd2", @"asd3",];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)menuTap
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(menuTap)];;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuController class]]) {
        self.slidingViewController.underLeftViewController = [[LeftMenuController alloc] initWithNibName:NSStringFromClass([LeftMenuController class]) bundle:nil];
        [self.view.superview addGestureRecognizer:self.slidingViewController.panGesture];
//        self.slidingViewController.anchorRightRevealAmount = 220.0f;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView reloadData];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

@end
