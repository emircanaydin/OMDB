//
//  SearchControllerData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

typealias TextChangeBlock = (String?) -> Void
typealias VoidCompletionBlock = () -> Void

class SearchControllerData {
    
    private(set) var textChangeListener: TextChangeBlock?
    
    func setTextChangeListener(by listener: @escaping TextChangeBlock) -> Self {
        textChangeListener = listener
        return self
    }
}
