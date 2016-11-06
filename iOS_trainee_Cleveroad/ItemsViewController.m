//
//  ItemsViewController.m
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemsDetailViewController.h"
#import "ListItem.h"

@interface ItemsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ItemsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"***hi");
    _items = nil;
    _items = [self.data getItems];
    NSLog(@"!!!%lu", (unsigned long)[[_data getItems] count]);
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ListItem *item = _items[indexPath.row];
    cell.textLabel.text = item.itemTitle;
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
        ListItem *item = _items[indexPath.row];
        [self.data deleteItemWithID:item.itemID];
        _items = [self.data getItems];
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
        ItemsDetailViewController *detailsViewController = (ItemsDetailViewController *)segue.destinationViewController;
        detailsViewController.data = self.data;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        ListItem *note = _items[indexPath.row];
        ItemsDetailViewController *detailsViewController = (ItemsDetailViewController *)segue.destinationViewController;
        detailsViewController.note = note;
    }
}

@end
