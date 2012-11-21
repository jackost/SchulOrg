//
//  DeveloperViewController.m
//  SchulOrg
//
//  Created by Jakob on 21.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "DeveloperViewController.h"

@interface DeveloperViewController ()

@end

@implementation DeveloperViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetBadgeButtonPressed:(id)sender {
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;

}

- (IBAction)badgeCountPressed:(id)sender {
    self.badgeCountLabel.text=[NSString stringWithFormat:@"%d", [UIApplication sharedApplication].applicationIconBadgeNumber];
}

- (void)viewDidUnload {
    [self setBadgeCountLabel:nil];
    [super viewDidUnload];
}
@end
