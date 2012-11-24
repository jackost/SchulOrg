//
//  DeveloperViewController.h
//  SchulOrg
//
//  Created by Jakob on 21.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeveloperViewController : UIViewController

- (IBAction)resetBadgeButtonPressed:(id)sender;
- (IBAction)badgeCountPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *badgeCountLabel;

@end
