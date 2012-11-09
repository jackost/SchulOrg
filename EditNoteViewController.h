//
//  EditNoteViewController.h
//  SchulOrg
//
//  Created by Jakob on 06.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotizenViewController;
@class JONote;

@interface EditNoteViewController : UITableViewController <UITextViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) JONote *note;

@property (nonatomic, strong)NotizenViewController *NotizenViewController;
@property (strong, nonatomic) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UILabel *nameField;

-(IBAction)editingDone:(id)sender;
- (IBAction)removeButtonPressed:(id)sender;

@end
