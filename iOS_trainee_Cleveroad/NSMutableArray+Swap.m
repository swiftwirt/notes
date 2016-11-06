//
//  NSMutableArray+Swap.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (Swap)

- (void)swapObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSNumber *temp = self[firstIndex];
    self[firstIndex] = self[secondIndex];
    self[secondIndex] = temp;
}

@end

