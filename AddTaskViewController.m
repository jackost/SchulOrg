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

@interface AddTaskViewController ()
 
@end

@implementation AddTaskViewController

@synthesize HausaufgabenViewController;
@synthesize contentField;
@synthesize subjectField;
@synthesize deadlineField;
@synthesize selectedSubject;

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
}

- (IBAction)doneButtonPressed:(id)sender {
    JOTask *newTask =[[JOTask alloc]initWithName:@"" Subject:subjectField.textLabel.text Content:contentField.text Deadline:[NSDate date] Done:NO];
    [self dismissModalViewControllerAnimated:YES];
    [self.HausaufgabenViewController.tasks addObject:newTask];
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
