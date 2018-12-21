//
//  NSArray+Map.h
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Map)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;

@end
