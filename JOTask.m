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

-(id)initWithName:(NSString *)name Content:(NSString *)content Done:(BOOL)done {
    self = [super init];
    
    if (self) {
        self.name=name;
        self.done=done;
        self.content=content;
    }
    return self;
}

@end
