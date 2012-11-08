//
//  DeadlineViewController.h
//  SchulOrg
//
//  Created by Jakob on 28.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddTaskViewController;

@interface DeadlineViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *deadlineLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *deadlinePicker;
@property (nonatomic, strong) AddTaskViewController *AddTaskViewController;


- (IBAction)deadlinePickerChanged:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;


@end
