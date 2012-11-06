//
//  EditTaskViewController.h
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JOTask;
@class HausaufgabenViewController;
@class SubjectViewController;

@interface EditTaskViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic, strong) JOTask *task;

@property (nonatomic, strong) IBOutlet UISwitch *doneSwitch;
@property (strong, nonatomic) IBOutlet UITableViewCell *subjectField;
@property (nonatomic, strong) IBOutlet UITextField *contentField;
@property (strong, nonatomic) IBOutlet UITableViewCell *deadlineField;

-(IBAction)taskDataChanged:(id)sender;

@end
