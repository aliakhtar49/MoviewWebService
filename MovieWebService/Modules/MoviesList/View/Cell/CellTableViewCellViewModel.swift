//
//  CellTableViewCellViewModel.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation

@objc
class CellTableViewCellViewModel: NSObject{
    
    var releaseDateString: String = ""
    var filmRatingString: String = ""
    var ratingString: String = ""
    var nameString: String = ""
    
    init(_ film: Film) {
        
        super.init()
        self.nameString = film.name
        self.releaseDateString = getFormattedReleaseDateString(film.releaseDate)
        self.filmRatingString = getFilmRatingString(film.filmRating)
        self.ratingString = film.rating.toString()
    }
    
    func getFilmRatingString(_ filmRating: FilmRating) -> String {
        let filmRatingText: String
        switch filmRating {
        case G:
            filmRatingText = "G"
        case PG:
            filmRatingText = "PG"
        case PG13:
            filmRatingText = "PG13"
        case R:
            filmRatingText = "R"
        default:
            filmRatingText = ""
            break
        }
        return filmRatingText;
    }
    func getFormattedReleaseDateString(_ releaseDate: Date) -> String {
        let calendar = NSCalendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: releaseDate)
        
    }
}
