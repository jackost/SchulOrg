//
//  AddTaskViewController.h
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HausaufgabenViewController;

@interface AddTaskViewController : UITableViewController <UITextFieldDelegate>

- (IBAction)doneButtonPressed:(id)sender;
-(IBAction)cancelButtonPressed:(id)sender;

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) HausaufgabenViewController *HausaufgabenViewController;
@property (strong, nonatomic) IBOutlet UITextField *contentField;

@end
