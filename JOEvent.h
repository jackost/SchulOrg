//
//  JOEvent.h
//  SchulOrg
//
//  Created by Jakob on 13.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOEvent : NSObject <NSCoding>

@property (nonatomic, strong)NSString *subject;
@property (nonatomic, strong)NSString *sort;
@property (nonatomic, strong)NSDate *deadline;
@property (nonatomic, strong)NSString *note;

-(id)initWithSubject:(NSString *)subject Sort:(NSString *)sort Deadline:(NSDate *)deadline Note:(NSString*)note;

@end
