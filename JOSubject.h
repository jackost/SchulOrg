//
//  JOSubject.h
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOSubject : NSObject

@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *teacher;

-(id)initWithSubject:(NSString*)subject AndTeacher:(NSString*)teacher;

@end
