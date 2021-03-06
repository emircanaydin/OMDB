//
//  MainViewController.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Private properties -
    private lazy var searchResultCollection: CollectionComponent = {
        let temp = CollectionComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private var searchController: SearchController!
    
    // MARK: - Public properties -

    var presenter: MainPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSearchController()
        addMainComponent()
        subscribeViewDataState()
        presenter.viewDidLoad()
    }
    
    private func addSearchController() {
        searchController = SearchController(viewModel: presenter.getSearchControllerData())
        navigationItem.searchController = searchController
    }
    
    private func addMainComponent() {
        
        searchResultCollection.setupDelegation(with: presenter)
        
        view.addSubview(searchResultCollection)
        
        NSLayoutConstraint.activate([
            
            searchResultCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchResultCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchResultCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            searchResultCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewDataState() {
        presenter.subscribeViewDataState { [weak self] state in
            switch state {
            case .failure, .loading:
                break
            case .newData:
                self?.searchResultCollection.reloadCollectionComponent()
                self?.searchResultCollection.scrollToTop()
            case .moreData:
                self?.searchResultCollection.reloadCollectionComponent()
            }
        }
    }

}

// MARK: - Extensions -

extension MainViewController: MainViewInterface {
}
