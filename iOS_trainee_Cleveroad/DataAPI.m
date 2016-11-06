//
//  DataAPI.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "DataAPI.h"
#import "DataModel.h"
#import "ListItem.h"

@interface DataAPI ()

@property (nonatomic, strong) DataModel *dataModel;

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
        _dataModel = [DataModel new];
        [self handleFirstLaunch];
    }
    return self;
}

- (NSMutableArray *)getItems
{
    NSMutableArray *tempArray = [NSMutableArray new];
    NSDictionary *tempDictionary = [_dataModel getAllItems];
    for (NSString *ID in tempDictionary) {
        if (ID.integerValue) {
            NSData *itemData = tempDictionary[ID];
            ListItem *itemDetails = [NSKeyedUnarchiver unarchiveObjectWithData:itemData];
            if (itemDetails) {
                [tempArray addObject:itemDetails];
            }
        }
    }
    return tempArray;
}

- (void)addItemWithName:(NSString *)name andDescription:(NSString *)description
{
    NSUInteger id = [self nextNoteID];
    NSString *stringID = [[NSString alloc] initWithFormat:@"%lu", (unsigned long)id];
    NSLog(@"*****%@", stringID);
    if (description) {
       ListItem *item = [[ListItem alloc] initWithTitle:name description:description andID:stringID];
       [_dataModel addItemWithID:stringID item:item];
    } else {
       ListItem *item = [[ListItem alloc] initWithTitle:name andID:stringID];
       [_dataModel addItemWithID:stringID item:item];
    }
}

- (void) deleteItemWithID:(NSString *)ID {
    [_dataModel deleteItemWithID:ID];
}

-(void) registerDefaults {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys: @"firstTime", true,
                                                                            @"nextID", 1, nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

-(NSUInteger) nextNoteID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSUInteger ID = [userDefaults integerForKey:@"nextID"];
    [userDefaults setInteger:ID + 1 forKey:@"nextID"];
    [userDefaults synchronize];
    return ID;
}

-(void) handleFirstLaunch {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL firstTime = [userDefaults boolForKey:@"firstTime"];
    if (firstTime) {
        [self registerDefaults];
        [userDefaults setBool:false forKey:@"firstTime"];
        [userDefaults synchronize];
    }
}

@end
