//
//  ModalViewController.h
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol TodoObjectProtocol <NSObject>

- (void) addToDoItem: (NSString*)taskName description:(NSString*) itemDesc;

@end

@interface ModalViewController : UIViewController
@property (nonatomic, weak) id<TodoObjectProtocol> delegate;

@end
