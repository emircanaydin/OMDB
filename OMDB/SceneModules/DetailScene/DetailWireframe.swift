//
//  DetailWireframe.swift
//  OMDB
//
//  Created by Emircan Aydın on 6.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailWireframe: BaseWireframe<DetailViewController> {

    init(movieImdbId: String) {
        let moduleViewController = DetailViewController()
        super.init(viewController: moduleViewController)

        let operationManager = MovieDetailOperationManager.shared
        let interactor = DetailInteractor(operationManager: operationManager)
        let presenter = DetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self).setupImdbId(by: movieImdbId)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DetailWireframe: DetailWireframeInterface {
}
