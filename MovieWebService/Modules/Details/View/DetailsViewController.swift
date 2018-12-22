//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController,DetailScreenModuleProtocol{
    var presenter: DetailScreenPresenterProtocol?
    weak var delegate: DetailScreenModuleProtocol?
    
    
    fileprivate let directorTitle = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 80), size: DetailScreenConstants.boxSize))
    fileprivate let directorName: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 120), size: DetailScreenConstants.boxSize))
        label.font = label.font.withSize(DetailScreenConstants.reducedFontSize)
        return label
    }()
    
    fileprivate lazy var tapToShowMore = TappableLabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 180), size: DetailScreenConstants.boxSize), delegate: self)!
    
    fileprivate let actorNameTitle = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 220), size: DetailScreenConstants.boxSize))
    fileprivate let actorName: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 260), size: DetailScreenConstants.boxSize))
        label.font = label.font.withSize(DetailScreenConstants.reducedFontSize)
        return label
    }()
    
    fileprivate let actorScreenNameTitle = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 300), size: DetailScreenConstants.boxSize))
    fileprivate let actorScreenName: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: DetailScreenConstants.xOffset, y: 340), size: DetailScreenConstants.boxSize))
        label.font = label.font.withSize(DetailScreenConstants.reducedFontSize)
        return label
    }()
    
    private func addSubviews() {
        view.addSubview(directorTitle)
        view.addSubview(directorName)
        view.addSubview(tapToShowMore)
        view.addSubview(actorNameTitle)
        view.addSubview(actorName)
        view.addSubview(actorScreenNameTitle)
        view.addSubview(actorScreenName)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSubviews()
        presenter?.viewIsReady()
        self.navigationItem.title = DetailScreenConstants.title

    }
    
}

extension DetailsViewController: DetailScreenViewProtocol {
    func showDirectorNameViewWith(_ directorNameText: String) {
        directorName.text = directorNameText
    }
    func showDirectorTitleViewWith(_ directorTitleText: String) {
        directorTitle.text = directorTitleText
    }
    
    func showActorScreenNameViewWith(_ actorScreenNameText: String) {
        actorScreenName.text = actorScreenNameText
    }
    func showActorScreenNameTitleViewWith(_ actorScreenNameTitleText: String) {
        actorScreenNameTitle.text = actorScreenNameTitleText
    }
    func showActorNameViewWith(_ actorNameText: String) {
        actorName.text = actorNameText
    }
    func showActorNameTitleViewWith(_ actorNameTitleText: String) {
        actorNameTitle.text = actorNameTitleText
    }
    func showTapToShowViewMoreButtonTitleViewWith(_ text: String) {
        tapToShowMore.text = text
    }
    func showOrHideActorNameAndTitleWith(_ isToShow: Bool) {
        actorNameTitle.isHidden = !isToShow
        actorName.isHidden = !isToShow
    }
    func showOrHideActorScreenNameAndTitleWith(_ isToShow: Bool) {
        actorScreenNameTitle.isHidden = !isToShow
        actorScreenName.isHidden = !isToShow
    }
}

extension DetailsViewController: TappableLabelDelegate {
    func didReceiveTouch() {
       presenter?.didTapOnAddMoreButton()
    }
  
}

