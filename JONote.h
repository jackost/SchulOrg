//
//  JONote.h
//  SchulOrg
//
//  Created by Jakob on 05.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JONote : NSObject <NSCoding>


@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSDate *date;


-(id)initWithName:(NSString *)name Content:(NSString *)content Date:(NSDate *)date;


@end
