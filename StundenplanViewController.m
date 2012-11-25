//
//  StundenplanViewController.m
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "StundenplanViewController.h"
#import "SchultagViewController.h"
#import "JOSubject.h"

@interface StundenplanViewController ()

@end

@implementation StundenplanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    //JOSubject *englisch = [[JOSubject alloc]initWithSubject:@"Englisch" AndTeacher:@"Fr. Peschel"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    self.montagArray = [[NSMutableArray alloc]initWithArray:[[defaults objectForKey:@"schultageArray"]objectAtIndex:0]];
    self.dienstagArray = [[NSMutableArray alloc]initWithArray:[[defaults objectForKey:@"schultageArray"]objectAtIndex:1]];
    self.mittwochArray = [[NSMutableArray alloc]initWithArray:[[defaults objectForKey:@"schultageArray"]objectAtIndex:2]];
    self.donnerstagArray = [[NSMutableArray alloc]initWithArray:[[defaults objectForKey:@"schultageArray"]objectAtIndex:3]];
    self.freitagArray = [[NSMutableArray alloc]initWithArray:[[defaults objectForKey:@"schultageArray"]objectAtIndex:4]];
    
    self.schultageArray = [[NSMutableArray alloc]initWithObjects:self.montagArray, self.dienstagArray, self.mittwochArray, self.donnerstagArray, self.freitagArray, nil];
    [[NSUserDefaults standardUserDefaults]setObject:self.schultageArray forKey:@"schultageArray"];

    self.navigationItem.rightBarButtonItem=self.editButtonItem;

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animate
{
    
    [super setEditing:editing animated:animate];
    if(editing)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"schultagEditRow" object:self];
        
    }
    
    else
    {
        self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"schultagStopEditRow" object:self];

        
    }
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[self.schultageArray objectAtIndex:self.selectedIndex] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return self.editing;
}*/





- (IBAction)addButtonPressed:(id)sender {
    
    self.schultageArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"schultageArray" ]] ;
    
    NSLog(@"%@", [self.schultageArray objectAtIndex:self.selectedIndex]);
    
    NSMutableArray *currentDay = [[NSMutableArray alloc]initWithArray:[self.schultageArray objectAtIndex:self.selectedIndex]];

    [currentDay addObject:[NSString stringWithFormat:@"%u. Stunde", currentDay.count+1]];

    [self.schultageArray replaceObjectAtIndex:self.selectedIndex withObject:currentDay];
    [[NSUserDefaults standardUserDefaults]setObject:self.schultageArray forKey:@"schultageArray"];


    //[[self.schultageArray objectAtIndex:self.selectedIndex] addObject:[NSString stringWithFormat:@"%u. Stunde", currentDay.count+1]];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"schultagReloadTableView" object:self];

}



@end
