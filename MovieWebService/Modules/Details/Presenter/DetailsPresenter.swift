//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

public class DetailsPresenter:DetailScreenPresenterProtocol {
    weak var view: DetailScreenViewProtocol?
    var router: DetailScreenRouterProtocol?
    var interactor: DetailScreenInteractorInputProtocol?
    

    var modelData: Film {
        didSet {
            
        }
    }
     var actorExpanded = false {
        didSet {
            view?.showOrHideActorNameAndTitleWith(actorExpanded)
            view?.showOrHideActorScreenNameAndTitleWith(actorExpanded)
            view?.showTapToShowViewMoreButtonTitleViewWith(actorExpanded ? DetailScreenConstants.showLessActionTitle : DetailScreenConstants.showMoreActionTitle)
        }
    }
    
    func viewIsReady() {
        
        view?.showActorNameViewWith(modelData.cast.first?.name ?? "")
        view?.showActorNameTitleViewWith(DetailScreenConstants.actorNameTitle)
        view?.showDirectorNameViewWith(modelData.director.name ?? "")
        view?.showDirectorTitleViewWith(DetailScreenConstants.directorNameTitle)
        view?.showActorScreenNameViewWith(modelData.cast.first?.screenName ?? "")
        view?.showActorScreenNameTitleViewWith(DetailScreenConstants.actorScreenNameTitle)
        actorExpanded = false
    }
    func didTapOnAddMoreButton() {
        actorExpanded = !actorExpanded
    }
    
    init(_ modelData: Film) {
        self.modelData = modelData
    }
    
}

extension DetailsPresenter: DetailScreenInteractorOutputProtocol {
  
}

