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
    
    UIActionSheet *asRemove = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Notiz löschen" otherButtonTitles: nil];
    
    [asRemove showFromToolbar:self.navigationController.toolbar];
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
            
    if(buttonIndex==0) {
        
        [self.NotizenViewController.notes removeObjectAtIndex:self.NotizenViewController.tableView.indexPathForSelectedRow.row];
        [self.navigationController popViewControllerAnimated:YES];
   
    }
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
