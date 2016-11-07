//
//  DataAPI.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "DataAPI.h"
#import "PersistencyManager.h"
#import "Note.h"

@interface DataAPI ()

@property (nonatomic, strong) PersistencyManager *dataModel;

@end

@implementation DataAPI

+ (DataAPI *)sharedInstance {
    static DataAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [DataAPI new];
    });
    return _sharedInstance;
}

-(id)init {
    if (self = [super init]) {
         [self registerDefaults];
         [self handleFirstLaunch];
        _dataModel = [PersistencyManager new];
    }
    return self;
}

- (NSMutableArray *)getNotes
{
    NSMutableArray *tempArray = [NSMutableArray new];
    NSDictionary *tempDictionary = [_dataModel getNotes];
    for (NSString *ID in tempDictionary) {
        if (ID.integerValue) {
            NSData *itemData = tempDictionary[ID];
            Note *itemDetails = [NSKeyedUnarchiver unarchiveObjectWithData:itemData];
            if (itemDetails) {
                [tempArray addObject:itemDetails];
            }
        }
    }
    return tempArray;
}

- (void) addNoteWithTitle:(NSString *)name andDescription:(NSString *)description
{
    NSUInteger id = [self nextNoteID];
    NSString *stringID = [[NSString alloc] initWithFormat:@"%lu", (unsigned long)id];
    NSLog(@"*****%@", stringID);
    if (description) {
       Note *note = [[Note alloc] initWithTitle:name description:description andID:stringID];
       [_dataModel addNoteWithID:stringID note:note];
    } else {
       Note *note = [[Note alloc] initWithTitle:name andID:stringID];
       [_dataModel addNoteWithID:stringID note:note];
    }
}

- (void) deleteNoteWithID:(NSString *)ID {
    [_dataModel deleteNoteWithID:ID];
}

-(void) registerDefaults {
    NSNumber *first = [NSNumber numberWithInt:1];
    NSNumber *id = [NSNumber numberWithInt:1];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys: first, @"firstTime",
                                id, @"nextID", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

-(void) handleFirstLaunch {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSUInteger firstTime = [userDefaults integerForKey:@"firstTime"];
    if (firstTime == 1) {
        NSLog(@"$$$");        
        [userDefaults setInteger:2 forKey:@"firstTime"];
        [userDefaults synchronize];
    }
}

-(NSUInteger) nextNoteID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSUInteger ID = [userDefaults integerForKey:@"nextID"];
    [userDefaults setInteger:ID + 1 forKey:@"nextID"];
    [userDefaults synchronize];
    return ID;
}

@end
