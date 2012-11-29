//
//  LessonViewController.h
//  SchulOrg
//
//  Created by Jakob on 26.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubjectViewController;
@class SchultagViewController;
@class JOLesson;

@interface LessonViewController : UITableViewController

@property (nonatomic, strong) SubjectViewController *subjectViewController;
@property (nonatomic, strong) SchultagViewController *schultagViewController;

@property (nonatomic, strong) JOLesson *lesson;
@property (nonatomic, assign) int selectedSubject;
@property (nonatomic, assign) int selectedRoom;
@property (nonatomic, assign) int indexPath;

@property (nonatomic, assign) BOOL subjectDone;
@property (nonatomic, assign) BOOL roomDone;
@property (strong, nonatomic) IBOutlet UITableViewCell *subjectField;
@property (strong, nonatomic) IBOutlet UITableViewCell *roomField;

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;


@end
