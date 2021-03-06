//
//  InfoViewController.m
//  SchulOrg
//
//  Created by Jakob on 10.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)doneButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
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


- (IBAction)homepageButtonPressed:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    
    if (url)
    {
        [[UIApplication sharedApplication]openURL:url];
    }
}

- (IBAction)helpButtonPressed:(id)sender {

    NSLog(@"%@",[[[UIApplication sharedApplication] scheduledLocalNotifications]description]);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if (indexPath.row==0) {

    }
    else if (indexPath.row==1){
        
    }
    else if (indexPath.row==2){
        
    }
    else if (indexPath.row==1){
        
    }
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
