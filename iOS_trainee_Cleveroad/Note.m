//
//  Note.m
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "Note.h"

@implementation Note 

-(Note *)initWithTitle:(NSString *)title andID:(NSString *)ID;
{
    _noteID = ID;
    _noteTitle = title;
    return [super init];
}

-(Note *)initWithTitle:(NSString *)title description:(NSString *)description andID:(NSString *)ID
{
    _noteID = ID;
    _noteTitle = title;
    _noteDetails = description;
    return [super init];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.noteID = [decoder decodeObjectForKey:@"noteID"];
        self.noteTitle = [decoder decodeObjectForKey:@"noteTitle"];
        self.noteDetails = [decoder decodeObjectForKey:@"noteDetails"];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.noteID forKey:@"noteID"];
    [aCoder encodeObject:self.noteTitle forKey:@"noteTitle"];
    [aCoder encodeObject:self.noteDetails forKey:@"noteDetails"];
}

@end
