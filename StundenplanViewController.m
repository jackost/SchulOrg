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

- (IBAction)buttonPressed:(id)sender {
    
    [[self.schultageArray objectAtIndex:self.selectedIndex ] addObject:@"Fach"];
    [[NSUserDefaults standardUserDefaults]setObject:self.schultageArray forKey:@"schultageArray"];
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"schultagReloadTableView" object:self];

}



@end
