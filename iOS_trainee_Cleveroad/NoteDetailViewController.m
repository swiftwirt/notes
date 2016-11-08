//
//  NoteDetailViewController.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "NoteDetailViewController.h"

@interface NoteDetailViewController () <UITextFieldDelegate>

@end

@implementation NoteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.titleTextField becomeFirstResponder];
    self.descriptionTextView.scrollEnabled = false;
    self.doneButton.enabled = false;
    if (self.note) {
        self.title = @"Edit Note";
        self.doneButton.enabled = true;
        self.titleTextField.text = self.note.noteTitle;
        self.descriptionTextView.text = self.note.noteDetails;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.descriptionTextView.scrollEnabled = true;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *oldText = self.titleTextField.text;
    NSString *newText = [oldText stringByReplacingCharactersInRange:range withString:string];
    self.doneButton.enabled = (newText.length > 0);
    return true;
}

- (IBAction)onSaveNoteButton:(id)sender {
    if (self.note) {
        [_data deleteNoteWithID:self.note.noteID];
        [_data addNoteWithTitle:self.titleTextField.text andDescription:self.descriptionTextView.text];
        self.note = nil;        
        [self.navigationController popViewControllerAnimated:true];
    } else {
        [_data addNoteWithTitle:self.titleTextField.text andDescription:self.descriptionTextView.text];
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end
