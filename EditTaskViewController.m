//
//  EditTaskViewController.m
//  SchulOrg
//
//  Created by Jakob on 26.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "EditTaskViewController.h"
#import "JOTask.h"
#import "HausaufgabenViewController.h"
#import "SubjectViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

@synthesize task = _task;
@synthesize doneSwitch = _doneSwitch;
@synthesize contentField;
@synthesize subjectField;
@synthesize deadlineField;


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
    
    
    self.contentField.text = self.task.content;
    self.subjectField.textLabel.text=self.task.subject;
    [self.doneSwitch setOn:self.task.done];
    self.contentField.delegate=self;

    
    NSDateFormatter *date_formater = [[NSDateFormatter alloc]init];
    [date_formater setDateFormat:@"EEEE, dd.MM.yyyy"];
    self.deadlineField.textLabel.text=[date_formater stringFromDate:self.task.deadline];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)taskDataChanged:(id)sender{
    
    self.task.done=self.doneSwitch.isOn;

    }

- (IBAction)removeButtonPressed:(id)sender {

    UIActionSheet *deleteActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Hausaufgabe löschen" otherButtonTitles: nil];
        [deleteActionSheet setTag:1];
    [deleteActionSheet showFromToolbar:self.navigationController.toolbar];
}

- (IBAction)actionButtonPressed:(id)sender {
    
    UIActionSheet *removeActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:nil otherButtonTitles:@"E-Mail", @"Drucken", nil];
    [removeActionSheet setTag:0];
    
    [removeActionSheet showFromToolbar:self.navigationController.toolbar];

}

- (IBAction)doneSwitchChanged:(id)sender {
    UISwitch *switcher = sender;
    if (self.task.notification!=nil) {
        
    
        if (switcher.isOn==1) {
        
        [[UIApplication sharedApplication]cancelLocalNotification:self.task.notification];
            if ([NSDate date]>=self.task.notification.fireDate) {
                
                [UIApplication sharedApplication].applicationIconBadgeNumber--;
            }
        }
        
        else {
        
            [[UIApplication sharedApplication]scheduleLocalNotification:self.task.notification];
        
        }
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (actionSheet.tag==1)
    {
        if(buttonIndex==0)
        {
            [self.HausaufgabenViewController.tasks removeObjectAtIndex:self.HausaufgabenViewController.tableView.indexPathForSelectedRow.row];
            if (self.task.notification!=nil) {
                [[UIApplication sharedApplication]cancelLocalNotification:self.task.notification];
                
                if ([NSDate date]>=self.task.notification.fireDate) {
                    
                    [UIApplication sharedApplication].applicationIconBadgeNumber--;
                }

            }

            [self.navigationController popViewControllerAnimated:YES];
        }
   
    }
    
    else if (actionSheet.tag==0)
    {
        if (buttonIndex==0)
        {
            if ([MFMailComposeViewController canSendMail])
            {
                MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
                mailer.mailComposeDelegate = self;
                [mailer setSubject:[NSString stringWithFormat:@"%@ Hausaufgabe",subjectField.textLabel.text]];
                NSString *emailBody = [NSString stringWithFormat:@"%@ Hausaufgabe für %@: \n%@.",self.subjectField.textLabel.text,self.deadlineField.textLabel.text,self.contentField.text];
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
                printInfo.outputType = UIPrintInfoOutputGeneral;
                printInfo.jobName = [NSString stringWithFormat:@"%@ Hausaufgabe", self.subjectField.textLabel.text];
                printInfo.duplex = UIPrintInfoDuplexLongEdge;
                printController.printInfo = printInfo;
                printController.showsPageRange = NO;
                printController.printingItem = [NSString stringWithFormat:@"%@ Hausaufgabe für %@: \n%@.",self.subjectField.textLabel.text,self.deadlineField.textLabel.text,self.contentField.text];
            
                void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
                    if (!completed && error) {
                        NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
                    }
                };
            
                [printController presentAnimated:YES completionHandler:completionHandler];
            }
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


-(void)textViewDidBeginEditing:(UITextView *)textView {
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editingDonePressed:)];
}

-(void)textViewDidChange:(UITextView *)textView{
    self.task.content=self.contentField.text;
}


-(IBAction)editingDonePressed:(id)sender {
    [self.contentField resignFirstResponder];
    [self.navigationController setToolbarHidden:NO];
    self.navigationItem.rightBarButtonItem=nil;
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

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];

    
}

- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [super viewDidUnload];
}
@end
