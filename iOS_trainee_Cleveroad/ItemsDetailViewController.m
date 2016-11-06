//
//  ItemsDetailViewController.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "ItemsDetailViewController.h"

@interface ItemsDetailViewController ()

@end

@implementation ItemsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onSaveNoteButton:(id)sender {
    [_data addItemWithName:self.titleTextField.text andDescription:self.descriptionTextView.text];
    [self.navigationController popViewControllerAnimated:true];
}

@end
