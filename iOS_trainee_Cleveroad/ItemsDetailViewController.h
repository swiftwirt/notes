//
//  ItemsDetailViewController.h
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ListItem.h"
#import "DataAPI.h"
//@class ItemsDetailViewController;
//
//@protocol ItemsDetailViewControllerDelegate <NSObject>
//@required
//
//-(void) userDidAddNote:(ListItem *)note inController:(ItemsDetailViewController *)controller;
//-(void) userDidFinishEditNote:(ListItem *)note inController:(ItemsDetailViewController *)controller;
//
//@end

@interface ItemsDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

//@property (assign) id<ItemsDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) DataAPI *data;

@end
