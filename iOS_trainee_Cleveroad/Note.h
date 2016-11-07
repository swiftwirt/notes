//
//  Note.h
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property (nonatomic, strong) NSString *noteID;
@property (nonatomic, strong) NSString *noteTitle;
@property (nonatomic, strong) NSString *noteDetails;

-(Note *)initWithTitle:(NSString *)title description:(NSString *)description andID:(NSString *)ID;
-(Note *)initWithTitle:(NSString *)title andID:(NSString *)ID;

@end
