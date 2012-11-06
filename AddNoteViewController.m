//
//  AddNoteViewController.m
//  SchulOrg
//
//  Created by Jakob on 05.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "AddNoteViewController.h"
#import "NotizenViewController.h"
#import "JONote.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

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

    self.nameField.delegate=self;
    
    
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameField) {
        [textField resignFirstResponder];
    }
    return NO;
}


- (IBAction)donePressed:(id)sender {
    JONote *newNote = [[JONote alloc]initWithName:self.nameField.text Content:self.contentField.text Date:[NSDate date]];
    [self.NotizenViewController.notes addObject:newNote];
    [self.NotizenViewController.tableView reloadData];
    [self dismissModalViewControllerAnimated:YES];
    
    
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
}


- (void)viewDidUnload {
    [self setNameField:nil];
    [self setContentField:nil];
    [super viewDidUnload];
}
@end
