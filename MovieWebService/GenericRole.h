//
//  GenericRole.h
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GenericRole : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *biography;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic) BOOL nominated;


- (id)initWithData:(NSDictionary *)data;

@end
