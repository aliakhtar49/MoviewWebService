//
//  BaseRouter.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 20/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//


import Foundation
import UIKit


@objc
class BaseRouter: NSObject {
    weak var window: UIWindow?
    var navigationController: BaseNavigationController!
    
    init(window: UIWindow) {
        super.init()
        self.window = window
        navigationController = BaseNavigationController()
    }
    
    func createBaseRoute() {
        if let  movieListViewController = MoviesListBuilder().build() {
            navigationController.viewControllers = [movieListViewController]
            self.window?.rootViewController = navigationController
        }
        
    }
}
