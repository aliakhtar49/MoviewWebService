//
//  Actor.m
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (id)initWithData:(NSDictionary *)data {
    self = [super initWithData:data];
    if (self) {
        self.screenName = [data objectForKey:@"screenName"];
    }
    return self;
}

@end
