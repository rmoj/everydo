//
//  ModalViewController.m
//  EveryDo
//
//  Created by Rene Mojica on 2016-07-12.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController () 
@property (weak, nonatomic) IBOutlet UITextField *textFieldModal;
@property (weak, nonatomic) IBOutlet UITextView *textViewModal;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (IBAction)clickedAdd:(UIButton *)sender {
    
    NSString *taskName = self.textFieldModal.text;
    NSString *taskDesc = self.textViewModal.text;

    [self.delegate addToDoItem:taskName description: taskDesc];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)clickedCancel:(UIButton *)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

//- (void)textFieldDidEndEditing:(UITextField *)textField{
//
//    NSString *taskName = self.textFieldModal.text;
//
//}

//
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    return YES;
//}       // return NO to disallow editing.
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    return YES;
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
