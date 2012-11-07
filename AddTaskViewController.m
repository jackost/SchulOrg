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
#import "SubjectViewController.h"
#import "DeadlineViewController.h"

@interface AddTaskViewController ()
 
@end

@implementation AddTaskViewController

@synthesize HausaufgabenViewController;
@synthesize DeadlineViewController;
@synthesize contentField;
@synthesize subjectField;
@synthesize deadlineField;
@synthesize selectedSubject;
@synthesize deadlineDate;

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
    contentField.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"SubjectSegue"]) {
        UINavigationController *SNavcon = segue.destinationViewController;
        SubjectViewController *SViewController = [SNavcon.viewControllers objectAtIndex:0];
        SViewController.AddTaskViewController=self;
    }
    else if ([segue.identifier isEqualToString:@"DeadlineSegue"]) {
        UINavigationController *DNavcon = segue.destinationViewController;
        DeadlineViewController *DViewController = [DNavcon.viewControllers objectAtIndex:0];
        DViewController.AddTaskViewController=self;
    }
}

- (IBAction)doneButtonPressed:(id)sender {
    JOTask *newTask =[[JOTask alloc]initWithSubject:subjectField.textLabel.text Content:contentField.text Deadline:deadlineDate Done:NO];
    
    [self.HausaufgabenViewController.tasks addObject:newTask];
    [self dismissModalViewControllerAnimated:YES];

}

-(void)cancelButtonPressed:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == contentField) {
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [super viewDidUnload];
}
@end
