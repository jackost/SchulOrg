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
    NSDateFormatter *date_formater = [[NSDateFormatter alloc]init];
    [date_formater setDateFormat:@"EEEE, dd.MM.yyyy"];
    deadlineLabel.text = [date_formater stringFromDate:[deadlinePicker date]];

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
    
    NSDateFormatter *date_formater = [[NSDateFormatter alloc]init];
    [date_formater setDateFormat:@"EEEE, dd.MM.yyyy"];

    NSLog(@"%@", [date_formater stringFromDate:[deadlinePicker date]]);
    deadlineLabel.text = [date_formater stringFromDate:[deadlinePicker date]];


}

- (IBAction)doneButtonPressed:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];

}

@end
