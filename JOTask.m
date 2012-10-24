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

-(id)initWithName:(NSString *)name done:(BOOL)done {
    self = [super init];
    
    if (self) {
        self.name=name;
        self.done=done;
    }
    return self;
}

@end
