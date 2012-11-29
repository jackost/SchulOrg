//
//  SubjectViewController.m
//  SchulOrg
//
//  Created by Jakob on 27.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "SubjectViewController.h"
#import "AddTaskViewController.h"
#import "LessonViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

@synthesize subjects;
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
    //self.subjects =[[NSMutableArray alloc]initWithObjects: @"Deutsch",@"Englisch",@"Mathe",@"Philosophie",@"Physik",@"µC",@"Französisch",@"Informatik",@"Sport",@"Elektrotechnik",@"Gesellschaftslehre",@"BWL",@"Business English", nil];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
     self.subjects = [[NSMutableArray alloc]init];
    [self.subjects setArray:[defaults objectForKey:@"savedSubjects"]];
    [self.subjects sortUsingSelector:@selector(compare:)];
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    if (self.addTaskViewController.isViewLoaded) {
        selectedSubject=self.addTaskViewController.selectedSubject;
    }
    else if (self.lessonViewController.isViewLoaded){
        selectedSubject=self.lessonViewController.selectedSubject;
    }
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


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (animated) {
        NSArray *savedSubjects = [NSArray arrayWithArray:self.subjects];
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        [defaults setObject:savedSubjects forKey:@"savedSubjects"];
        
    }
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
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
        
    }
    
    else
    {
        self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
        
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
    self.addTaskViewController.subjectField.textLabel.text=[subjects objectAtIndex:indexPath.row];
    self.addTaskViewController.subjectField.textLabel.font = [UIFont boldSystemFontOfSize:18];
    self.addTaskViewController.selectedSubject=indexPath.row;
    self.addTaskViewController.subjectDone=YES;
    
    self.lessonViewController.subjectField.textLabel.text=[subjects objectAtIndex:indexPath.row];
    self.lessonViewController.subjectField.textLabel.font = [UIFont boldSystemFontOfSize:18];
    self.lessonViewController.selectedSubject=indexPath.row;
    self.lessonViewController.subjectDone=YES;
    
    [self.lessonViewController.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];

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
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
