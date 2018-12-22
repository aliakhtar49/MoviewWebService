//
//  CellTableViewCellViewModel.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation

@objc
class CellTableViewCellPresenter: NSObject{
    
    weak var view: CellTableViewCellViewProtocol?
    var film: Film
    
    init(_ film: Film) {
        self.film = film
        super.init()
        
    }
    fileprivate func retrieveFilmRating() {
        
        let filmRatingText: String
        switch film.filmRating {
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
        view?.showFilmRatingView(with: filmRatingText)
        
    }
    
    fileprivate func retrieveFormattedReleaseDate() {
        //TODO: make a singelton date formatter since it's very CPU intensive operation 
        let calendar = NSCalendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.current
        view?.showReleaseDateView(with: dateFormatter.string(from: film.releaseDate))
    }
    fileprivate func retrieveFilmName() {
        view?.showFilmNameView(with: film.name)
        
    }
    fileprivate func retrieveRating() {
        view?.showRatingView(with: film.rating.toString())
    }
  
}

extension CellTableViewCellPresenter: CellTableViewCellPresenterProtocol {
    
    func retrieveContents() {
        retrieveFilmRating()
        retrieveFormattedReleaseDate()
        retrieveFilmName()
        retrieveRating()
    }
    
}
