//
//  PersistencyManager.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager ()

@end

@implementation PersistencyManager

-(NSDictionary *)getNotes
{
    return [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
}

-(void)deleteNoteWithID:(NSString *)ID
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ID];
}

-(void)addNoteWithID:(NSString *)ID note:(Note *)note
{
    NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:note];
    
    [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:ID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"***%@", itemData.description);
}

@end
