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
    
    contentField.delegate =self;
    
    self.contentField.text = self.task.content;
    self.subjectField.textLabel.text=self.task.subject;
    [self.doneSwitch setOn:self.task.done];
    
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
    
    self.task.content=self.contentField.text;
    self.task.done=self.doneSwitch.isOn;

    }

- (IBAction)removeButtonPressed:(id)sender {
    
    UIActionSheet *asRemove = [[UIActionSheet alloc] initWithTitle:@"Wollen Sie die Hausaufgabe wirklich löschen ?" delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Ja" otherButtonTitles: nil];
    
    [asRemove showInView:self.view];
    

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([actionSheet.title isEqualToString:@"Wollen Sie die Hausaufgabe wirklich löschen ?"]) {

        if(buttonIndex==0) {
            
            [self.HausaufgabenViewController.tasks removeObjectAtIndex:self.HausaufgabenViewController.tableView.indexPathForSelectedRow.row];
            [self.navigationController popViewControllerAnimated:YES];
         
        } 
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == contentField) {
        [textField resignFirstResponder];
    }
    return NO;
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setDeadlineField:nil];
    [self setRemoveButton:nil];
    [super viewDidUnload];
}
@end
