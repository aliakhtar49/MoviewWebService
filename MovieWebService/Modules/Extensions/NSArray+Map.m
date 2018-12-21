//
//  NSArray+Map.m
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "NSArray+Map.h"

@implementation NSArray (Map)



- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return result;
}



@end
