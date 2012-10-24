//
//  JOTask.h
//  SchulOrg
//
//  Created by Jakob on 24.10.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOTask : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)BOOL done;
-(id)initWithName: (NSString *)name done:(BOOL)done;

@end
