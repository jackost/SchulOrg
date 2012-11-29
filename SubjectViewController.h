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
@class LessonViewController;

@interface SubjectViewController : UITableViewController <UIAlertViewDelegate>


@property (strong, nonatomic) NSMutableArray *subjects;
@property (strong, nonatomic) LessonViewController *lessonViewController;
@property (nonatomic, strong) AddTaskViewController *addTaskViewController;
@property (nonatomic, assign) int selectedSubject;

@property (nonatomic, strong) JOTask *task;

-(IBAction)cancelButtonPressed:(id)sender;
-(IBAction)addButtonPressed:(id)sender;

@end
