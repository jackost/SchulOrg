//
//  JOLesson.h
//  SchulOrg
//
//  Created by Jakob on 26.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOLesson : NSObject

@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *room;

-(id)initWithSubject:(NSString*)subject AndRoom:(NSString*)room;


@end
