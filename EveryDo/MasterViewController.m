//
//  MasterViewController.m
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"

@interface MasterViewController () 

@property NSMutableArray *objects;
@property NSString *taskDescription;

@end

@implementation MasterViewController


- (Todo*) createToDoItemWithTitle: (NSString*)title description:(NSString*)desc priority:(int) priorityNumber {

    return [[Todo alloc]initWithTitle:title description:desc priority:priorityNumber];

}

- (void)prepToDoItems {
    
    self.objects = [[NSMutableArray alloc] init];

    [self.objects addObject: [self createToDoItemWithTitle:@"Feed the dog" description:@"Use up old stock" priority:0]];
    [self.objects addObject: [self createToDoItemWithTitle:@"Install Neovim" description:@"Use new rc" priority:1]];
    [self.objects addObject: [self createToDoItemWithTitle:@"Go to gym" description:@"Workout #2" priority:2]];
    [self.objects addObject: [self createToDoItemWithTitle:@"Wash the car" description:@"Go to Esso" priority:3]];
    [self.objects addObject: [self createToDoItemWithTitle:@"Do assignment" description:@"Don't sleep" priority:4]];
    [self.objects addObject: [self createToDoItemWithTitle:@"Learn swift" description:@"Go to Ray's site" priority:5]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self prepToDoItems];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    //inserting: count
    //creating:count-1
    
    Todo *toDoItem = [self createToDoItemWithTitle:@"New Task" description:@"This is a new task" priority:(int) self.objects.count];
    [self.objects insertObject:toDoItem atIndex:self.objects.count];
//    [self.objects insertObject:[NSDate date] atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.objects.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
        
 //       controller.detailItem = object;
        controller.detailDescriptionLabel.text = object.taskDescription;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
    cell.textLabel.text = object.title;
//    cell.textLabel.text = [object title];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
