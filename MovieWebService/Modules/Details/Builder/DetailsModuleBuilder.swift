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

        let sb = UIStoryboard(name: "MoviewDetailView", bundle: nil)
        let movieDetailScreenViewController = sb.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let router = DetailsRouter()
        router.viewController = movieDetailScreenViewController

        let presenter = DetailsPresenter(data)
        presenter.view = movieDetailScreenViewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        movieDetailScreenViewController.presenter = presenter
        
        return movieDetailScreenViewController
    }

}
