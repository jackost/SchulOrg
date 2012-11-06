//
//  AddNoteViewController.h
//  SchulOrg
//
//  Created by Jakob on 05.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotizenViewController;

@interface AddNoteViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong)NotizenViewController *NotizenViewController;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextView *contentField;

- (IBAction)donePressed:(id)sender;
- (IBAction)cancelPressed:(id)sender;

@end
