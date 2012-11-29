//
//  SchultagViewController.h
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StundenplanViewController;

@interface SchultagViewController : UITableViewController

@property (nonatomic, strong) StundenplanViewController *stundenplanViewController;

@property (nonatomic, strong) NSMutableArray *schultagArray;
@property (nonatomic, strong) NSString *titel;

-(void)reloadTableView;
-(void)editRow;
-(void)stopEditRow;





@end
