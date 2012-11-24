//
//  JOEvent.m
//  SchulOrg
//
//  Created by Jakob on 13.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JOEvent.h"

@implementation JOEvent

-(id)initWithSubject:(NSString *)subject Sort:(NSString *)sort Deadline:(NSDate *)deadline Note:(NSString *)note {
    
    self=[super init];
    
    if (self) {
        self.subject=subject;
        self.sort=sort;
        self.deadline=deadline;
        self.note=note;
    }
    return self;
}


- (id) initWithCoder: (NSCoder *)coder
{
	self = [super init];
    if (self)
	{
		self.subject = [coder decodeObjectForKey:@"subject"];
		self.sort = [coder decodeObjectForKey:@"sort"];
        self.deadline = [coder decodeObjectForKey:@"deadline"];
        self.note = [coder decodeObjectForKey:@"note"];

	}
	
	return self;
}


- (void) encodeWithCoder: (NSCoder *)coder
{
	[coder encodeObject:self.subject forKey:@"subject"];
    [coder encodeObject:self.sort forKey:@"sort"];
	[coder encodeObject:self.deadline forKey:@"deadline"];
	[coder encodeObject:self.note forKey:@"note"];
    
}


@end
