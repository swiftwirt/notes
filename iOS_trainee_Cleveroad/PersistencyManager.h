//
//  PersistencyManager.h
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface PersistencyManager : NSObject

-(NSDictionary *)getNotes;
-(void)addNoteWithID:(NSString *)ID note:(Note *)note;
-(void)deleteNoteWithID:(NSString *)ID;

@end
