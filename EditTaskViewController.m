//
//  EditTaskViewController.m
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "EditTaskViewController.h"
#import "JOTask.h"
#import "HausaufgabenViewController.h"
#import "SubjectViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

@synthesize task = _task;
@synthesize doneSwitch = _doneSwitch;
@synthesize contentField;
@synthesize subjectField;
@synthesize deadlineField;


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
    
    contentField.delegate =self;
    
    self.contentField.text = self.task.content;
    self.subjectField.textLabel.text=self.task.subject;
    [self.doneSwitch setOn:self.task.done];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)taskDataChanged:(id)sender{
    
    self.task.content=self.contentField.text;
    self.task.done=self.doneSwitch.isOn;
    self.task.subject=self.subjectField.textLabel.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == contentField) {
        [textField resignFirstResponder];
    }
    return NO;
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [super viewDidUnload];
}
@end
