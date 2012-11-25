//
//  SchultagViewController.m
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "SchultagViewController.h"
#import "StundenplanViewController.h"
#import "JOSubject.h"

@interface SchultagViewController ()

@end

@implementation SchultagViewController

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTableView) name:@"schultagReloadTableView" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(editRow) name:@"schultagEditRow" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(stopEditRow) name:@"schultagStopEditRow" object:nil];
    
}


-(void)reloadTableView{
    
    [self.tableView reloadData];
    
}

-(void)editRow{
    
    [self setEditing:YES animated:YES];
}

-(void)stopEditRow{
    
    [self setEditing:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    [self.tableView reloadData];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    NSArray *schultageArray = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"schultageArray"]];
    self.schultagArray = [[NSMutableArray alloc]initWithArray:[schultageArray objectAtIndex:self.tabBarController.selectedIndex]];
    NSLog(@"%@", [self.schultagArray description]);
    
    return [self.schultagArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SubjectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier /*forIndexPath:indexPath*/];
    
    // Configure the cell...
    
    cell.textLabel.text=[self.schultagArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        NSArray *tage = [[NSArray alloc]initWithObjects:@"Montag", @"Dienstag", @"Mittwoch", @"Donnerstag", @"Freitag", nil];
         self.titel = [[NSString alloc]initWithFormat:@"%@", [tage objectAtIndex:self.tabBarController.selectedIndex]];

    }
    
    else{
        self.titel = nil;
    }
    
    return self.titel;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return self.editing;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.schultagArray removeObjectAtIndex:indexPath.row];

        NSMutableArray *schultageArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"schultageArray"]];
        
        [schultageArray replaceObjectAtIndex:self.tabBarController.selectedIndex withObject:self.schultagArray];
        
        [[NSUserDefaults standardUserDefaults]setObject:schultageArray forKey:@"schultageArray"];        
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
