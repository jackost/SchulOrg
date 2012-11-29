//
//  RoomViewController.m
//  SchulOrg
//
//  Created by Jakob on 25.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "RoomViewController.h"
#import "LessonViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

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

    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    self.rooms = [[NSMutableArray alloc]init];
    [self.rooms setArray:[defaults objectForKey:@"savedRooms"]];
    [self.rooms sortUsingSelector:@selector(compare:)];
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    self.selectedRoom=self.lessonViewController.selectedRoom;
    [self.tableView reloadData];


}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (animated) {
        NSArray *savedRooms = [NSArray arrayWithArray:self.rooms];
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        [defaults setObject:savedRooms forKey:@"savedRooms"];
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *UncheckedCellIdentifier = @"UncheckedRoomCell";
    static NSString *CheckedCellIdentifier = @"CheckedRoomCell";
    
    NSString *CellIdentifier = (indexPath.row==self.selectedRoom) ? CheckedCellIdentifier : UncheckedCellIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text=[self.rooms objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [self.rooms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.editing;
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



#pragma mark - Table view delegate


-(IBAction)addButtonPressed:(id)sender {
    
    UIAlertView *addSubjectAlert = [[UIAlertView alloc]initWithTitle:@"Raum hinzufügen"
                                                             message:@"Raum Nummer"
                                                            delegate:self
                                                   cancelButtonTitle:@"Abbrechen"
                                                   otherButtonTitles:@"Ok", nil];
    [addSubjectAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [addSubjectAlert textFieldAtIndex:0].autocapitalizationType=UITextAutocapitalizationTypeWords;
    [addSubjectAlert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self.rooms addObject:[NSString stringWithFormat:@"%@",[alertView textFieldAtIndex:0].text]];
        [self.rooms sortUsingSelector:@selector(compare:)];
        [self.tableView reloadData];
    }
    else if (buttonIndex==0){
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.lessonViewController.roomField.textLabel.text=[self.rooms objectAtIndex:indexPath.row];
    self.lessonViewController.roomField.textLabel.font = [UIFont boldSystemFontOfSize:18];
    self.lessonViewController.selectedRoom=indexPath.row;
    self.lessonViewController.subjectDone=YES;
    [self.lessonViewController.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
