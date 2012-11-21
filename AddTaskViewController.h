//
//  AddTaskViewController.h
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HausaufgabenViewController;
@class SubjectViewController;
@class DeadlineViewController;

@interface AddTaskViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, assign) int selectedSubject;
@property (nonatomic, assign) BOOL subjectDone;
@property (nonatomic, assign) BOOL contentDone;
@property (nonatomic, assign) BOOL deadlineDone;

@property (nonatomic, strong) NSDate *deadlineDate;

@property (strong, nonatomic) IBOutlet UITableViewCell *subjectField;
@property (nonatomic, strong) HausaufgabenViewController *HausaufgabenViewController;
@property (nonatomic, strong) DeadlineViewController *DeadlineViewController;
@property (strong, nonatomic) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UITableViewCell *deadlineField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) UILocalNotification *notification;
@property (strong, nonatomic) IBOutlet UILabel *remindLabel;
@property (strong, nonatomic) IBOutlet UIStepper *remindStepper;

- (IBAction)doneButtonPressed:(id)sender;
-(IBAction)cancelButtonPressed:(id)sender;
- (IBAction)remindStepperChanged:(id)sender;


@end
