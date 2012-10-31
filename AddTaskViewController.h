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

@interface AddTaskViewController : UITableViewController <UITextFieldDelegate>

- (IBAction)doneButtonPressed:(id)sender;
-(IBAction)cancelButtonPressed:(id)sender;

@property (nonatomic, assign) int selectedSubject;
@property (nonatomic, strong) NSDate *deadlineDate;


@property (strong, nonatomic) IBOutlet UITableViewCell *subjectField;
@property (nonatomic, strong) HausaufgabenViewController *HausaufgabenViewController;
@property (nonatomic, strong) DeadlineViewController *DeadlineViewController;
@property (strong, nonatomic) IBOutlet UITextField *contentField;
@property (strong, nonatomic) IBOutlet UITableViewCell *deadlineField;

@end
