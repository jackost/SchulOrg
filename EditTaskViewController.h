//
//  EditTaskViewController.h
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JOTask;

@interface EditTaskViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UISwitch *doneSwitch;
@property (nonatomic, strong) IBOutlet UITextField *contentField;

@property (nonatomic, strong) JOTask *task;

@end
