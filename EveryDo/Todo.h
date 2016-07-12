//
//  Todo.h
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *taskDescription;
@property int priorityNumber;
@property BOOL isCompleted;

- (instancetype) initWithTitle: (NSString*)title description:(NSString*)taskDescription priority:(int)priorityNumber;

@end
