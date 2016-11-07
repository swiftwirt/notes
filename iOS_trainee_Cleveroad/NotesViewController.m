//
//  NotesViewController.m
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "NSMutableArray+SellSort.h"
#import "NotesViewController.h"
#import "NoteDetailViewController.h"
#import "Note.h"

@interface NotesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *notes;

@end

@implementation NotesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _notes = nil;
    [self getSortedByTitleNotes];
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Note *note = _notes[indexPath.row];
    cell.textLabel.text = note.noteTitle;
    return cell;
}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self performSegueWithIdentifier:@"EditItem" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Remove" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        Note *note = _notes[indexPath.row];
        [self.data deleteNoteWithID:note.noteID];
        [self getSortedByTitleNotes];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    deleteButton.backgroundColor = [UIColor orangeColor];
    NSArray *actions = [NSArray arrayWithObject:deleteButton];
    return actions;
}

#pragma mark Actions

- (IBAction)onAddItemBarButton:(id)sender {
    [self performSegueWithIdentifier:@"AddItem" sender:nil];
}

#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        NoteDetailViewController *detailsViewController = (NoteDetailViewController *)segue.destinationViewController;
        detailsViewController.data = self.data;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Note *note = _notes[indexPath.row];
        NoteDetailViewController *detailsViewController = (NoteDetailViewController *)segue.destinationViewController;
        detailsViewController.data = self.data;
        detailsViewController.note = note;
    }
}

-(void)getSortedByTitleNotes {
    _notes = [self.data getNotes];
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"noteTitle"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [_notes sortedArrayUsingDescriptors:sortDescriptors];
    _notes = nil;
    _notes = sortedArray;
}

@end
