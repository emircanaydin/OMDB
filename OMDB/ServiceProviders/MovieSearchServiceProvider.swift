//
//  MovieSearchServiceProvider.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class SearchServiceProvider: ApiServiceProvider<SearchRequestModel> {
    
    init(searchRequest: SearchRequestModel) {
        super.init(method: .get, baseUrl: BaseUrl.ombd.value, data: searchRequest)
    }
}
