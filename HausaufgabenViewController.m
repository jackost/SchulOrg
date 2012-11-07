//
//  HausaufgabenViewController.m
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "HausaufgabenViewController.h"
#import "JOTask.h"
#import "AddTaskViewController.h"
#import "EditTaskViewController.h"

@interface HausaufgabenViewController ()

@end

@implementation HausaufgabenViewController

@synthesize tasks=_tasks;

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *loadTasks = [defaults objectForKey:@"savedTasks"];
    self.tasks = [[NSMutableArray alloc]init];
    [self.tasks setArray:[NSKeyedUnarchiver unarchiveObjectWithData:loadTasks]];
    [super viewDidLoad];
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
        NSData *savedTasks = [NSKeyedArchiver archivedDataWithRootObject:self.tasks];
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        [defaults setObject:savedTasks forKey:@"savedTasks"];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        
        UINavigationController *ATNavcon = segue.destinationViewController;
        AddTaskViewController *ATViewController = [ATNavcon.viewControllers objectAtIndex:0];
        ATViewController.HausaufgabenViewController=self;
    }
    else if ([segue.identifier isEqualToString:@"EditDoneTaskSegue"] || [segue.identifier isEqualToString:@"EditNotDoneTaskSegue"]){
        
        EditTaskViewController *editTaskViewController = segue.destinationViewController;
        editTaskViewController.task = [self.tasks objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NotDoneCellIdentifier = @"NotDoneTaskCell";
    static NSString *DoneCellIdentifier = @"DoneTaskCell";

    JOTask *currentTask = [self.tasks objectAtIndex:indexPath.row];
    
    
    NSString *cellIdentifier = currentTask.done ? DoneCellIdentifier : NotDoneCellIdentifier;
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier /* forIndexPath:indexPath*/];
    
    // Configure the cell...
    
    cell.textLabel.text=currentTask.subject;
    cell.detailTextLabel.text=currentTask.content;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    JOTask *moveTask = [self.tasks objectAtIndex:fromIndexPath.row];
    [self.tasks removeObjectAtIndex:fromIndexPath.row];
    [self.tasks insertObject:moveTask atIndex:toIndexPath.row];
}

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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - IBActions

-(void)editButtonPressed:(id)sender{
    
    self.editing = !self.editing;
}

@end
