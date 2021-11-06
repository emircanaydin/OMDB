//
//  MovieDetailOperationManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation
import RxSwift
import DefaultNetworkOperationPackage

class MovieDetailOperationManager: MovieDetailOperationManagerProtocol {
    
    public static let shared = MovieDetailOperationManager()
    
    private let dataPublishSubject = PublishSubject<DetailResult>()
    
    func getMovieDetail(with detailRequest: DetailRequestModel) {
        getDetailApiCall(detailRequest: detailRequest, with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping DetailResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    private func getDetailApiCall(detailRequest: DetailRequestModel, with completion: @escaping DetailResultBlock) {
        
        do {
            let urlRequest = try MovieDetailServiceProvider(detailRequest: detailRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: apiCallHandler)
        } catch _ {}
    }
    
    private lazy var apiCallHandler: DetailResultBlock = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
    }
    
}
