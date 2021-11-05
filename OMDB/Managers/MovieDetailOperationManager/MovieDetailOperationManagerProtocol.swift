//
//  MovieDetailOperationManagerProtocol.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

typealias DetailResult = Result<Movie, ErrorResponse>
typealias DetailResultBlock = (Result<Movie, ErrorResponse>) -> Void

protocol MovieDetailOperationManagerProtocol {
    func getMovieDetail(with detailRequest: DetailRequestModel)
    func subscribeDataPublisher(with completion: @escaping DetailResultBlock) -> Disposable
}
