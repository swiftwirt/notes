//
//  DataModel.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "DataModel.h"

@interface DataModel ()

@end

@implementation DataModel

-(NSDictionary *)getAllItems
{
    return [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
}

-(void)deleteItemWithID:(NSString *)ID
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ID];
}

-(void)addItemWithID:(NSString *)ID item:(ListItem *)item
{
    NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
    
    [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:ID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"***%@", itemData.description);
}

@end
