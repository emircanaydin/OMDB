//
//  SearchController.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation
import UIKit

class SearchController: BaseSearchController<SearchControllerData> {
    
    private var searchWorkItem: DispatchWorkItem?
    private var lastTerm = ""
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        self.searchResultsUpdater = self
    }
}

// MARK: - UISearchResultsUpdating
extension SearchController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchWorkItem?.cancel()
        let term = searchController.searchBar.text ?? ""
        
        let newTask = DispatchWorkItem { [weak self] in
            self?.lastTerm = term
            self?.viewModel.textChangeListener?(term)
        }
        
        self.searchWorkItem = newTask
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: newTask)
    }
}
