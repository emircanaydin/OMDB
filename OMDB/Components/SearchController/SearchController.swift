//
//  SearchController.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation
import UIKit

class SearchController: BaseSearchController<SearchControllerData> {
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        self.searchBar.delegate = self
    }
}

// MARK: - UISearchResultsUpdating
extension SearchController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let term = searchBar.text ?? ""
        viewModel.textChangeListener?(term)
    }
}
