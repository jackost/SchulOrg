//
//  HelpViewController.m
//  SchulOrg
//
//  Created by Jakob on 05.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeHelpView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)feedbackButtonPressed:(id)sender {
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Feedback zur SchulOrg-App"];
        NSString *emailBody = nil;
        [mailer setMessageBody:emailBody isHTML:NO];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"jackost93@yahoo.de", nil];
        [mailer setToRecipients:toRecipients];
        // UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
        // NSData *imageData = UIImagePNGRepresentation(myImage);
        // [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        [self presentModalViewController:mailer animated:YES];
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                message:@"Ihr Gerät unterstützt diese Funktion leider nicht."
                                                delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
        [alert show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


@end
