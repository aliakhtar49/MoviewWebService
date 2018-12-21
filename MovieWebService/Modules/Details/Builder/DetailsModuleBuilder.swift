//
//  DetailsModuleBuilder.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import UIKit

@objc class DetailsModuleBuilder: NSObject {

    func build(with data: Film) -> UIViewController {

        let viewController = DetailsViewController()

        let router = DetailsRouter()
        router.viewController = viewController

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
       // viewController.director = data

        return viewController
    }

}
