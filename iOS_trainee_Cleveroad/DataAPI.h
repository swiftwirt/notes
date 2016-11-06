//
//  DataAPI.h
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAPI : NSObject

+ (DataAPI *)sharedInstance;

- (NSMutableArray *)getItems;
- (void)addItemWithName:(NSString *)name andDescription:(NSString *)description;
- (void) deleteItemWithID:(NSString *)ID;

@end
