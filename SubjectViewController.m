//
//  SubjectViewController.m
//  SchulOrg
//
//  Created by Jakob on 27.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "SubjectViewController.h"
#import "AddTaskViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

@synthesize subjects;
@synthesize AddTaskViewController;
@synthesize selectedSubject;

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
    self.subjects =[[NSMutableArray alloc]initWithObjects: @"Deutsch",@"Englisch",@"Mathe",@"Philosophie",@"Physik",@"µC",@"Französisch",@"Informatik",@"Sport",@"Elektrotechnik",@"Gesellschaftslehre",@"BWL",@"Business English", nil];
    [self.subjects sortUsingSelector:@selector(compare:)];
    self.navigationItem.rightBarButtonItem=self.editButtonItem;

    selectedSubject=self.AddTaskViewController.selectedSubject;
    [self.tableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [subjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *UncheckedCellIdentifier = @"UncheckedSubjectCell";
    static NSString *CheckedCellIdentifier = @"CheckedSubjectCell";
    
    NSString *CellIdentifier = (indexPath.row==selectedSubject) ? CheckedCellIdentifier : UncheckedCellIdentifier;

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier /*forIndexPath:indexPath*/];
    cell.textLabel.text = [subjects objectAtIndex:indexPath.row];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return self.editing;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.subjects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animate
{
    
    [super setEditing:editing animated:animate];
    if(editing)
    {
        NSLog(@"editMode on");
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
        
    }
    
    else
    {
        NSLog(@"editMode off");
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
        
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.AddTaskViewController.subjectField.textLabel.text=[subjects objectAtIndex:indexPath.row];
    
    self.AddTaskViewController.selectedSubject=indexPath.row;
    self.AddTaskViewController.subjectDone=YES;
    [self.AddTaskViewController.tableView reloadData];
    [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)addButtonPressed:(id)sender {
   
    UIAlertView *addSubjectAlert = [[UIAlertView alloc]initWithTitle:@"Fach hinzufügen"
                                                             message:@"Name des neuen Fachs"
                                                            delegate:self
                                                   cancelButtonTitle:@"Abbrechen"
                                                   otherButtonTitles:@"Ok", nil];
    [addSubjectAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [addSubjectAlert textFieldAtIndex:0].autocapitalizationType=UITextAutocapitalizationTypeWords;
    [addSubjectAlert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self.subjects addObject:[NSString stringWithFormat:@"%@",[alertView textFieldAtIndex:0].text]];
        [self.subjects sortUsingSelector:@selector(compare:)];
        [self.tableView reloadData];
    }
    else if (buttonIndex==0){
        NSLog(@"Cancel");
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
