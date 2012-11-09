//
//  HelpViewController.h
//  SchulOrg
//
//  Created by Jakob on 05.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HelpViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)closeHelpView:(id)sender;
- (IBAction)feedbackButtonPressed:(id)sender;


@end
