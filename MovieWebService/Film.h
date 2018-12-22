//
//  Film.h
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Actor.h"
#import "Director.h"

typedef enum {
    G = 0,
    PG,
    PG13,
    R,
    NC17
} FilmRating;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject {
}

@property (nonatomic, assign) FilmRating filmRating;
@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSArray<Actor*> *cast;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double rating;
@property (nonatomic, strong) Director *director;
@property (nonatomic, assign) BOOL nominated;

- (id)initWithData:(NSDictionary *)data;



@end

NS_ASSUME_NONNULL_END
