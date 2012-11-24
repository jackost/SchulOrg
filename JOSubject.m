//
//  JOSubject.m
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import "JOSubject.h"

@implementation JOSubject

-(id)initWithSubject:(NSString*)subject AndTeacher:(NSString*)teacher {
    
    self = [super init];
    
    if (self) {
        self.subject=subject;
        self.teacher=teacher;
    }
    return self;
}


@end
