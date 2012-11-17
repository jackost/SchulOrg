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
    selectedSubject=1337;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ((self.deadlineDone) & (self.subjectDone)) {
        self.doneButton.enabled=YES;
    }
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


-(void)textViewDidBeginEditing:(UITextView *)textView {
    
   
}


- (IBAction)doneButtonPressed:(id)sender {
    JOTask *newTask =[[JOTask alloc]initWithSubject:subjectField.textLabel.text Content:contentField.text Deadline:deadlineDate Done:NO];
    
    [self.HausaufgabenViewController.tasks addObject:newTask];
    UILocalNotification *notification =[[UILocalNotification alloc]init];
    [notification setAlertBody:[NSString stringWithFormat: @"%@ Hausaufgabe noch zu erledigen",self.subjectField.textLabel.text]];
    [notification setFireDate:deadlineDate];
    [notification setAlertAction:@"Launch"]; //The button's text that launches the application and is shown in the alert
    [notification setHasAction: YES]; //Set that pushing the button will launch the application
    [notification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1]; //Set the Application Icon Badge Number of the application's icon to the current Application Icon Badge Number plus 1
    [[UIApplication sharedApplication] scheduleLocalNotification:notification]; //Schedule the notification with the system
    [self dismissModalViewControllerAnimated:YES];
    

}

-(void)cancelButtonPressed:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
}
@end
