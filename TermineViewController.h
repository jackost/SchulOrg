//
//  TermineViewController.h
//  SchulOrg
//
//  Created by Jakob on 21.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
@interface TermineViewController : UITableViewController <EKEventEditViewDelegate> {
    
}
- (IBAction)addButtonPressed:(id)sender;

@end
