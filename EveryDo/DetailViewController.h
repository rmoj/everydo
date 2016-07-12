//
//  DetailViewController.h
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

