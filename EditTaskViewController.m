//
//  EditTaskViewController.m
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "EditTaskViewController.h"
#import "JOTask.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

@synthesize nameField = _nameField;
@synthesize task = _task;
@synthesize doneSwitch = _doneSwitch;

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
    self.nameField.text = self.task.name;
    [self.doneSwitch setOn:self.task.done];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)taskDataChanged:(id)sender{
    
    self.task.name=self.nameField.text;
    self.task.done=self.doneSwitch.isOn;
    
}

@end
