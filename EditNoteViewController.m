//
//  EditNoteViewController.m
//  SchulOrg
//
//  Created by Jakob on 06.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "EditNoteViewController.h"
#import "NotizenViewController.h"
#import "JONote.h"

@interface EditNoteViewController ()

@end

@implementation EditNoteViewController

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
    
    self.nameField.text=self.note.name;
    self.contentField.text=self.note.content;
    self.contentField.delegate=self;

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


- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    if (animated) {
        
        self.note.name=self.nameField.text;
        self.note.content=self.contentField.text;
        
    }
}


-(void)textViewDidBeginEditing:(UITextView *)textView {

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editingDone:)];
    
}

-(IBAction)editingDone:(id)sender {
    [self.contentField resignFirstResponder];
    [self.navigationController setToolbarHidden:NO];
    self.navigationItem.rightBarButtonItem=nil;
}

- (IBAction)removeButtonPressed:(id)sender {
    
    UIActionSheet *removeActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Notiz löschen" otherButtonTitles: nil];
    
    [removeActionSheet showFromToolbar:self.navigationController.toolbar];
    [removeActionSheet setTag:1];
    
}

- (IBAction)actionButtonPressed:(id)sender {
    
    UIActionSheet *actionActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail", @"Drucken", nil];
    [actionActionSheet setTag:0];
    
    [actionActionSheet showFromToolbar:self.navigationController.toolbar];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
            
    
    if (actionSheet.tag==0)
    {
        if (buttonIndex==0)
        {
            if ([MFMailComposeViewController canSendMail])
            {
                MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
                mailer.mailComposeDelegate = self;
                [mailer setSubject:[NSString stringWithFormat:@"%@",self.nameField.text]];
                NSString *emailBody = [NSString stringWithFormat:@"%@",self.contentField.text];
                [mailer setMessageBody:emailBody isHTML:NO];
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
        
        else if (buttonIndex==1)
        {
            UIPrintInteractionController *printController = [UIPrintInteractionController sharedPrintController];
            
            if(printController) {
                
                printController.delegate = self;
                
                UIPrintInfo *printInfo = [UIPrintInfo printInfo];
                printInfo.outputType = UIPrintInfoOutputGrayscale;
                printInfo.jobName = [NSString stringWithFormat:@"Notiz"];
                printInfo.duplex = UIPrintInfoDuplexNone;
                printController.printInfo = printInfo;
                printController.showsPageRange = NO;
                printController.printingItem = [NSString stringWithFormat:@"%@\n\n%@",self.nameField.text, self.contentField.text];
                
                void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
                    if (!completed && error) {
                        NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
                    }
                };
                
                [printController presentAnimated:YES completionHandler:completionHandler];
            }
        }
    }

    else if (actionSheet.tag==1)
    {
        if(buttonIndex==0)
        {
            [self.NotizenViewController.notes removeObjectAtIndex:self.NotizenViewController.tableView.indexPathForSelectedRow.row];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
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


- (void)textFieldDidBeginEditing:(UITextField *)textField {

    [self.navigationController setToolbarHidden:YES];
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.navigationController setToolbarHidden:NO];
    
}


- (void)viewDidUnload {
    [self setNameField:nil];
    [self setContentField:nil];
    [super viewDidUnload];
}

@end
