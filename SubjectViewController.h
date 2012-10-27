//
//  SubjectViewController.h
//  SchulOrg
//
//  Created by Jakob on 27.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddTaskViewController;
@class JOTask;

@interface SubjectViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *subjects;
@property (nonatomic, strong) AddTaskViewController *AddTaskViewController;
@property (nonatomic, assign) int selectedSubject;

@property (nonatomic, strong) JOTask *task;


@end
