//
//  ListItem.h
//  ТЗ_iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject <NSCoding>

@property (nonatomic, strong) NSString *itemID;
@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic, strong) NSString *itemDescription;

-(ListItem *)initWithTitle:(NSString *)title description:(NSString *)description andID:(NSString *)ID;
-(ListItem *)initWithTitle:(NSString *)title andID:(NSString *)ID;

@end
