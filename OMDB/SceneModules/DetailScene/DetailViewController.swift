//
//  DetailViewController.swift
//  OMDB
//
//  Created by Emircan Aydın on 6.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Private properties -
    private lazy var detailView: MovieDetailView = {
        let temp = MovieDetailView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: - Public properties -

    var presenter: DetailPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        addMovieDetailComponent()
        listenDataState()
        presenter.viewDidLoad()
    }
    
    private func addMovieDetailComponent() {
        view.addSubview(detailView)

        NSLayoutConstraint.activate([

            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    private func listenDataState() {
        presenter.listenDataState { [weak self] detailData in
            self?.detailView.setData(data: detailData)
        }
    }

}

// MARK: - Extensions -

extension DetailViewController: DetailViewInterface {
}
