//
//  JOTask.m
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JOTask.h"

@implementation JOTask
@synthesize name = _name;
@synthesize done = _done;
@synthesize content = _content;
@synthesize subject = _subject;
@synthesize deadline = _deadline;

-(id)initWithName:(NSString *)name Subject:(NSString *)subject Content:(NSString *)content Deadline:(NSDate *)deadline Done:(BOOL)done {
    self = [super init];
    
    if (self) {
        self.name=name;
        self.done=done;
        self.content=content;
        self.subject=subject;
        self.deadline=deadline;
    }
    return self;
}

@end
