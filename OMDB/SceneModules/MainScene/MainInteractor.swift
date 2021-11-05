//
//  MainInteractor.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//
//

import Foundation
import RxSwift

final class MainInteractor {
    
    private let operationManager: SearchOperationManagerProtocol
    
    init(operationManager: SearchOperationManagerProtocol) {
        self.operationManager = operationManager
    }
}

// MARK: - Extensions -
extension MainInteractor: MainInteractorInterface {
    
    func search(with searchRequest: SearchRequestModel) {
        operationManager.search(with: searchRequest)
    }
    
    func subscribeDataPublisher(with completion: @escaping SearchResultBlock) -> Disposable {
        operationManager.subscribeDataPublisher(with: completion)
    }
}
