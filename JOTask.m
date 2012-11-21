//
//  JOTask.m
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JOTask.h"

@implementation JOTask

@synthesize done = _done;
@synthesize content = _content;
@synthesize subject = _subject;
@synthesize deadline = _deadline;

-(id)initWithSubject:(NSString *)subject Content:(NSString *)content Deadline:(NSDate *)deadline Done:(BOOL)done LocalNotification:(UILocalNotification*)notification {
    self = [super init];
    
    if (self) {
        self.done=done;
        self.content=content;
        self.subject=subject;
        self.deadline=deadline;
        self.notification=notification;
    }
    return self;
}

- (id) initWithCoder: (NSCoder *)coder
{
	self = [super init];
    if (self)
	{
		self.content = [coder decodeObjectForKey:@"content"];
		self.subject = [coder decodeObjectForKey:@"subject"];
		self.deadline = [coder decodeObjectForKey:@"deadline"];
        self.done = [coder decodeBoolForKey:@"done"];
        self.notification = [coder decodeObjectForKey:@"notification"];
	}
	
	return self;
}


- (void) encodeWithCoder: (NSCoder *)coder
{
	[coder encodeBool:self.done forKey:@"done"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.deadline forKey:@"deadline"];
	[coder encodeObject:self.subject forKey:@"subject"];
    [coder encodeObject:self.notification forKey:@"notification"];

}


@end
