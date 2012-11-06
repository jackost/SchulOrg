//
//  JONote.m
//  SchulOrg
//
//  Created by Jakob on 05.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JONote.h"

@implementation JONote


-(id)initWithName:(NSString *)name Content:(NSString *)content
{
    self = [super init];
    
    if (self) {
        self.name=name;
        self.content=content;
    }
    return self;
}


- (id) initWithCoder: (NSCoder *)coder
{
	self = [super init];
    
    if (self)
	{
		self.content = [coder decodeObjectForKey:@"content"];
        self.name = [coder decodeObjectForKey:@"name"];
	}
	
	return self;
}


- (void) encodeWithCoder: (NSCoder *)coder
{
	[coder encodeObject:self.content forKey:@"content"];
    [coder encodeObject:self.name forKey:@"name"];

}


@end
