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
    
    self.montagArray = [[NSMutableArray alloc]initWithObjects:@"Englisch", @"Deutsch", @"Physik", nil];
    self.dienstagArray = [[NSMutableArray alloc]initWithObjects:@"Französisch", @"Sport", @"Philosophie", nil];
    self.mittwochArray = [[NSMutableArray alloc]init];
    self.donnerstagArray = [[NSMutableArray alloc]init];
    self.freitagArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *schultageArray = [[NSMutableArray alloc]initWithObjects:self.montagArray, self.dienstagArray, self.mittwochArray, self.donnerstagArray, self.freitagArray, nil];
    [[NSUserDefaults standardUserDefaults]setObject:schultageArray forKey:@"schultageArray"];

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
    
    NSLog(@"View-Index: %i, %@", self.selectedIndex, [self.selectedViewController description]);
    }



@end
