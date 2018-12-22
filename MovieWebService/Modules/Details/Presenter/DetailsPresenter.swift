//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

class DetailsPresenter: DetailsModuleInput, DetailsPresenterProtocol, DetailsInteractorOutput {

    weak var view: DetailsViewProtocol!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!

    // MARK: - DetailsViewOutput
    
    func viewIsReady() {

    }
    
    // MARK: - DetailsInteractorOutput
    
    
    
}
