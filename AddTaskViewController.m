//
//  AddTaskViewController.m
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "AddTaskViewController.h"
#import "HausaufgabenViewController.h"
#import "JOTask.h"

@interface AddTaskViewController ()
 
@end

@implementation AddTaskViewController

@synthesize HausaufgabenViewController;
@synthesize nameField;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)doneButtonPressed:(id)sender {
    JOTask *newTask =[[JOTask alloc]initWithName:nameField.text done:NO];
    [self dismissModalViewControllerAnimated:YES];
    [self.HausaufgabenViewController.tasks addObject:newTask];
    [self.HausaufgabenViewController.tableView reloadData];
}

-(void)cancelButtonPressed:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}
@end
