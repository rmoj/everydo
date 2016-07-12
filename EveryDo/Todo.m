//
//  Todo.m
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype) initWithTitle: (NSString*)title description:(NSString*)taskDescription priority:(int)priorityNumber {

    self = [super init];
    
    if (self) {
    
        _title = title;
        _taskDescription = taskDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = false;
    
    }

    return self;
}

@end
