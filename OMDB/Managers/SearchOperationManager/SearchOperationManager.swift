//
//  SearchOperationManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation
import RxSwift
import DefaultNetworkOperationPackage

class SearchOperationManager: SearchOperationManagerProtocol {
    
    public static let shared = SearchOperationManager()
    
    private let dataPublishSubject = PublishSubject<SearchResult>()
    
    func search(with searchRequest: SearchRequestModel) {
        searchApiCall(searchRequest: searchRequest, with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping SearchResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func searchApiCall(searchRequest: SearchRequestModel, with completion: @escaping SearchResultBlock) {
        
        do {
            let urlRequest = try SearchServiceProvider(searchRequest: searchRequest).returnUrlRequest()
            ApiManagerBuilder.build().executeRequest(urlRequest: urlRequest, completion: completion)
        } catch _ {} // sry dont have error handler forgive me :(:(:(:(
    }
    
    private lazy var apiCallHandler: SearchResultBlock = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
    }
}
