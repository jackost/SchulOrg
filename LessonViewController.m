//
//  LessonViewController.m
//  SchulOrg
//
//  Created by Jakob on 26.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "LessonViewController.h"
#import "RoomViewController.h"
#import "SubjectViewController.h"
#import "RoomViewController.h"
#import "SchultagViewController.h"
#import "JOLesson.h"

@interface LessonViewController ()

@end

@implementation LessonViewController

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
    
    
    self.selectedSubject=1337;
    self.selectedRoom=1337;
    self.subjectField.textLabel.text=[self.schultagViewController.schultagArray objectAtIndex:self.schultagViewController.tableView.indexPathForSelectedRow.row];


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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"SubjectSegue"]) {
        SubjectViewController *SViewController = segue.destinationViewController;
        SViewController.lessonViewController=self;
    }
    else if ([segue.identifier isEqualToString:@"RoomSegue"]) {
        RoomViewController *RViewController = segue.destinationViewController;
        RViewController.lessonViewController=self;
    }
}


- (void)viewDidUnload {
    [self setSubjectField:nil];
    [self setRoomField:nil];
    [super viewDidUnload];
}
- (IBAction)doneButtonPressed:(id)sender {
    
    
    self.lesson = [[JOLesson alloc]initWithSubject:self.subjectField.textLabel.text AndRoom:self.roomField.textLabel.text];
    
    NSMutableArray *schultageArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"schultageArray" ]] ;
    
    NSMutableArray *currentDay = [[NSMutableArray alloc]initWithArray:[schultageArray objectAtIndex:self.schultagViewController.tabBarController.selectedIndex]];
    [currentDay replaceObjectAtIndex:self.schultagViewController.tableView.indexPathForSelectedRow.row withObject:self.lesson.subject];
        
    [schultageArray replaceObjectAtIndex:self.schultagViewController.tabBarController.selectedIndex withObject:currentDay];
    [[NSUserDefaults standardUserDefaults]setObject:schultageArray forKey:@"schultageArray"];
    
    [self.schultagViewController.tableView reloadData];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"schultagReloadTableView" object:self];

    [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];

}
@end
