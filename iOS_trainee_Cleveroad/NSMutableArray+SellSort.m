//
//  NSMutableArray+SellSort.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/6/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "NSMutableArray+SellSort.h"
#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (SellSort)

-(void) shellSortWithKey:(NSString *)key {
    if ([key isEqualToString:@"integerValue"]) {
        int j;
        int step = self.count / 2;
        while (step > 0) {
            for (int i = 0; i < (self.count - step); i++) {
                j = i;
                while ((j >= 0) && (self[j] > self[j + step])){
                        id tmp = self[j];
                        self[j] = self[j + step];
                        self[j + step] = tmp;
                        j-=step;
                  }
            }
            step = step / 2;
        }
    }
}

@end
