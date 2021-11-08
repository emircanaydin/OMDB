//
//  SearchOperationManagerProtocol.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

typealias SearchResult = Result<SearchResponse, ErrorResponse>
typealias SearchResultBlock = (Result<SearchResponse, ErrorResponse>) -> Void

protocol SearchOperationManagerProtocol {
    func search(with searchRequest: SearchRequestModel)
    func subscribeDataPublisher(with completion: @escaping SearchResultBlock) -> Disposable
}
