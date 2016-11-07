//
//  NoteDetailViewController.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "NoteDetailViewController.h"

@interface NoteDetailViewController ()

@end

@implementation NoteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.titleTextField becomeFirstResponder];
    self.descriptionTextView.scrollEnabled = false;
    if (self.note) {
        self.title = @"Edit Note";
        self.titleTextField.text = self.note.noteTitle;
        self.descriptionTextView.text = self.note.noteDetails;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.descriptionTextView.scrollEnabled = true;
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
