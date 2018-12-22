//
//  DetailsSscreenProtocol.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 22/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation

//Module Protocol
protocol DetailScreenModuleProtocol: class {
    var delegate: DetailScreenModuleProtocol? { get set }
}




//VIPER Protocol
protocol DetailScreenRouterProtocol: class {
    var viewController: DetailsViewController? { get set }
}

protocol DetailScreenViewProtocol: class {
    var presenter: DetailScreenPresenterProtocol? { get set }
    func showDirectorNameViewWith(_ directorNameText: String)
    func showDirectorTitleViewWith(_ directorTitleText: String)
    
    func showActorScreenNameViewWith(_ actorScreenNameText: String)
    func showActorScreenNameTitleViewWith(_ actorScreenNameTitleText: String)
    
    func showActorNameViewWith(_ actorNameText: String)
    func showActorNameTitleViewWith(_ actorNameTitleText: String)
    
    func showTapToShowViewMoreButtonTitleViewWith(_ text: String)
    func showOrHideActorNameAndTitleWith(_ isToShow: Bool)
    func showOrHideActorScreenNameAndTitleWith(_ isToShow: Bool) 
}

protocol DetailScreenInteractorInputProtocol : class {
      var presenter: DetailScreenInteractorOutputProtocol? { get set }
}

protocol DetailScreenPresenterProtocol: class {
    func viewIsReady()
    var view: DetailScreenViewProtocol? { get set }
    var router: DetailScreenRouterProtocol? { get set }
    var interactor : DetailScreenInteractorInputProtocol? { get set }
    func didTapOnAddMoreButton()
    var actorExpanded: Bool { get set }
}

protocol DetailScreenInteractorOutputProtocol: class {

}
