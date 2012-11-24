//
//  SettingsViewController.h
//  SchulOrg
//
//  Created by Jakob on 16.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UILabel *stundenplanGruppenLabel;

- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)stundenplanGruppenStepperChanged:(id)sender;

@end
