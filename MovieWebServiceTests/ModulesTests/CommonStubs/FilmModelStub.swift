//
//  FilmModelStub.swift
//  MovieWebServiceTests
//
//  Created by Ali Akhtar on 23/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation


struct FilmModelStub {
    static func buildFilmModelStub() -> Film {
        let mockData: [String : Any] = [
            "filmRating": 3, "languages":  ["English","Thai"],
            "nominated":  1,
            "releaseDate": 1350000000,
            "cast":  [
                [
                    "dateOfBirth":  -436147200,
                    "nominated":  1,
                    "name":  "Bryan Cranston",
                    "screenName":  "Jack Donnell",
                    "biography":  "Bryan Lee Cranston is an American actor, voice actor, writer and director."
                ]
            ],
            "name":  "Argo",
            "rating":  7.8,
            "director":  [
                "dateOfBirth":  82684800,
                "nominated":  1,
                "name":  "Ben Affleck",
                "biography":  "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
            ]
        ]
        return Film(data: mockData)
    }
}
