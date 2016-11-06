//
//  DataModel.h
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItem.h"

@interface DataModel : NSObject

-(NSDictionary *)getAllItems;
-(void)addItemWithID:(NSString *)ID item:(ListItem *)item;
-(void)deleteItemWithID:(NSString *)ID;

@end
