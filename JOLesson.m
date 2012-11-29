//
//  JOLesson.m
//  SchulOrg
//
//  Created by Jakob on 26.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JOLesson.h"

@implementation JOLesson

-(id)initWithSubject:(NSString*)subject AndRoom:(NSString*)room {
    
    self = [super init];
    
    if (self) {
        self.subject=subject;
        self.room=room;
    }
    return self;
}

@end
