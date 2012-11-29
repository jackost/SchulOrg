//
//  RoomViewController.h
//  SchulOrg
//
//  Created by Jakob on 25.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LessonViewController;

@interface RoomViewController : UITableViewController

@property(nonatomic, strong) LessonViewController *lessonViewController;
@property (nonatomic, strong) NSMutableArray *rooms;
@property (nonatomic, assign) int selectedRoom;

@end
