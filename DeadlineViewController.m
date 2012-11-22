//
//  DeadlineViewController.m
//  SchulOrg
//
//  Created by Jakob on 28.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "DeadlineViewController.h"
#import "AddTaskViewController.h"

@interface DeadlineViewController ()

@end

@implementation DeadlineViewController

@synthesize deadlineLabel;
@synthesize deadlinePicker;
@synthesize AddTaskViewController;

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
    
    deadlinePicker.minimumDate = [NSDate date];
    NSDateFormatter *date_formatter = [[NSDateFormatter alloc]init];
    [date_formatter setDateFormat:@"EEEE, dd.MM.yyyy"];
    deadlineLabel.text = [date_formatter stringFromDate:[deadlinePicker date]];
    

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

- (void)viewDidUnload {
    [self setDeadlineLabel:nil];
    [self setDeadlinePicker:nil];
    [self.AddTaskViewController.tableView reloadData];

    [super viewDidUnload];
}

- (IBAction)deadlinePickerChanged:(id)sender {
    
    NSDateFormatter *date_formatter = [[NSDateFormatter alloc]init];
    [date_formatter setDateFormat:@"EEEE, dd.MM.yyyy"];

    deadlineLabel.text = [date_formatter stringFromDate:[deadlinePicker date]];


}

- (IBAction)doneButtonPressed:(id)sender {
    
    self.AddTaskViewController.deadlineField.textLabel.text=self.deadlineLabel.text;
    self.AddTaskViewController.deadlineField.textLabel.font = [UIFont boldSystemFontOfSize:18];

    [self.AddTaskViewController.tableView reloadData];
    self.AddTaskViewController.deadlineDate=[deadlinePicker date];
    self.AddTaskViewController.deadlineDone=YES;
    [self dismissModalViewControllerAnimated:YES];

}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
