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

- (NSMutableArray *)getNotes;
- (void)addNoteWithTitle:(NSString *)name andDescription:(NSString *)description;
- (void) deleteNoteWithID:(NSString *)ID;

@end
