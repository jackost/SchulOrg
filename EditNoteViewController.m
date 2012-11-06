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


- (void)viewDidUnload {
    [self setNameField:nil];
    [self setContentField:nil];
    [super viewDidUnload];
}
@end
