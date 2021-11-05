//
//  MovieDetailServiceProvider.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MovieDetailServiceProvider: ApiServiceProvider<DetailRequestModel> {
    
    init(detailRequest: DetailRequestModel) {
        super.init(method: .get, baseUrl: BaseUrl.ombd, data: detailRequest)
    }
}
