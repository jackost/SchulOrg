//
//  EditTaskViewController.h
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class JOTask;
@class HausaufgabenViewController;
@class SubjectViewController;

@interface EditTaskViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate, UIPrintInteractionControllerDelegate>

@property (nonatomic, strong) JOTask *task;
@property (nonatomic, strong) HausaufgabenViewController *HausaufgabenViewController;

@property (nonatomic, strong) IBOutlet UISwitch *doneSwitch;
@property (strong, nonatomic) IBOutlet UITableViewCell *subjectField;
@property (nonatomic, strong) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UITableViewCell *deadlineField;
@property (strong, nonatomic) IBOutlet UITableViewCell *remindField;

-(IBAction)editingDonePressed:(id)sender;
-(IBAction)removeButtonPressed:(id)sender;
- (IBAction)actionButtonPressed:(id)sender;
- (IBAction)doneSwitchChanged:(id)sender;

@end
