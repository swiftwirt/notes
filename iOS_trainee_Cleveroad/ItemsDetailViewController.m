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
    [self.titleTextField becomeFirstResponder];
    if (self.note) {
        self.title = @"Edit Note";
        self.titleTextField.text = self.note.itemTitle;
        self.descriptionTextView.text = self.note.itemDescription;
    }
}

- (IBAction)onSaveNoteButton:(id)sender {
    if (self.note) {
        [_data deleteItemWithID:self.note.itemID];
        [_data addItemWithName:self.titleTextField.text andDescription:self.descriptionTextView.text];
        self.note = nil;        
        [self.navigationController popViewControllerAnimated:true];
    } else {
        [_data addItemWithName:self.titleTextField.text andDescription:self.descriptionTextView.text];
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end
