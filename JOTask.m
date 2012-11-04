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

-(id)initWithSubject:(NSString *)subject Content:(NSString *)content Deadline:(NSDate *)deadline Done:(BOOL)done {
    self = [super init];
    
    if (self) {
        self.done=done;
        self.content=content;
        self.subject=subject;
        self.deadline=deadline;
    }
    return self;
}

- (id) initWithCoder: (NSCoder *)coder
{
	self = [super init];
    if (self)
	{
		self.content = [coder decodeObjectForKey:@"name"];
		self.subject = [coder decodeObjectForKey:@"address"];
		self.deadline = [coder decodeObjectForKey:@"position"];
        self.done = [coder decodeBoolForKey:@"done"];
	}
	
	return self;
}


- (void) encodeWithCoder: (NSCoder *)coder
{
	[coder encodeBool:self.done forKey:@"done"];
	[coder encodeObject:self.content forKey:@"content"];
	[coder encodeObject:self.deadline forKey:@"deadline"];
	[coder encodeObject:self.subject forKey:@"subject"];

}


@end
