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
        [self.remindLabel setTextColor:[UIColor blackColor]];
        [self.remindStepper setEnabled:YES];
        self.doneButton.enabled=YES;
    }
    
    self.notification = [[UILocalNotification alloc]init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSDateComponents* components = [[NSDateComponents alloc]init];
    [components setDay:(-1)];
    NSDate* fireDate = [calendar dateByAddingComponents: components toDate: self.deadlineDate options: 0];
    [self.notification setAlertBody:[NSString stringWithFormat: @"%@ Hausaufgabe noch zu erledigen",self.subjectField.textLabel.text]];
    [self.notification setFireDate:fireDate];
    [self.notification setAlertAction:@"Anzeigen"];
    [self.notification setHasAction: YES];
    [self.notification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1];
    NSDateFormatter *date_formatter = [[NSDateFormatter alloc]init];
    [date_formatter setDateFormat:@"EEEE, dd.MM.yyyy"];

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
    
    JOTask *newTask =[[JOTask alloc]initWithSubject:subjectField.textLabel.text Content:contentField.text Deadline:deadlineDate Done:NO LocalNotification:self.notification];
    [self.HausaufgabenViewController.tasks addObject:newTask];
    
    if (self.notification!=nil) {
        
        [[UIApplication sharedApplication] scheduleLocalNotification:self.notification]; //Schedule the notification with the system

    }
    
    else{
        NSLog(@"Notification = nil");
    }
    [self dismissModalViewControllerAnimated:YES];
    
}

-(void)cancelButtonPressed:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)remindStepperChanged:(id)sender {
    UIStepper *stepper =sender;
    
    self.notification = [[UILocalNotification alloc]init];

    if ([stepper value]==0) {
        [self.remindLabel setText:@"Nicht erinnern"];
        self.notification=Nil;

    }
    else {
        if ((int)[stepper value]==1) {
            
            [self.remindLabel setText:[NSString stringWithFormat:@"%i Tag vor Abgabe", (int)stepper.value]];
        }
    
        else {
            
            [self.remindLabel setText:[NSString stringWithFormat:@"%i Tage vor Abgabe", (int)stepper.value]];
        }
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSDateComponents* components = [[NSDateComponents alloc]init];
        [components setDay:((int)stepper.value)*-1];
        NSDate* fireDate = [calendar dateByAddingComponents: components toDate: self.deadlineDate options: 0];
        
        [self.notification setAlertBody:[NSString stringWithFormat: @"%@ Hausaufgabe noch zu erledigen",self.subjectField.textLabel.text]];
        [self.notification setFireDate:fireDate];
        [self.notification setAlertAction:@"Anzeigen"]; 
        [self.notification setHasAction: YES];
        [self.notification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1];
        NSDateFormatter *date_formatter = [[NSDateFormatter alloc]init];
        [date_formatter setDateFormat:@"EEEE, dd.MM.yyyy"];
    }
}


- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [self setDoneButton:nil];
    [self setRemindLabel:nil];
    [self setRemindStepper:nil];
    [super viewDidUnload];
}
@end
