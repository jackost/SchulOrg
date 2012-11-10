//
//  InfoViewController.h
//  SchulOrg
//
//  Created by Jakob on 10.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface InfoViewController : UITableViewController <MFMailComposeViewControllerDelegate>

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)feedbackButtonPressed:(id)sender;
- (IBAction)homepageButtonPressed:(id)sender;

@end
