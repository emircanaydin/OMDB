//
//  BaseSearchController.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import UIKit

class BaseSearchController<V>: UISearchController {
    
    var viewModel: V!
    
    init(viewModel: V) {
        super.init(searchResultsController: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
    }
    
    func prepareViewControllerConfigurations() {
        
    }
}
