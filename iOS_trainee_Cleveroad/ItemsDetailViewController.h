//
//  ItemsDetailViewController.h
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"
#import "DataAPI.h"

@interface ItemsDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (nonatomic, strong) DataAPI *data;
@property (nonatomic, strong) ListItem *note;

@end
