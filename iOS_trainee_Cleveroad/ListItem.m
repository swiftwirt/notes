//
//  ListItem.m
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem 

-(ListItem *)initWithTitle:(NSString *)title andID:(NSString *)ID;
{
    _itemID = ID;
    _itemTitle = title;
    return [super init];
}

-(ListItem *)initWithTitle:(NSString *)title description:(NSString *)description andID:(NSString *)ID
{
    _itemID = ID;
    _itemTitle = title;
    _itemDescription = description;
    return [super init];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.itemID = [decoder decodeObjectForKey:@"itemID"];
        self.itemTitle = [decoder decodeObjectForKey:@"itemTitle"];
        self.itemDescription = [decoder decodeObjectForKey:@"itemDescription"];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.itemID forKey:@"itemID"];
    [aCoder encodeObject:self.itemTitle forKey:@"itemTitle"];
    [aCoder encodeObject:self.itemDescription forKey:@"itemDescription"];
}

@end
