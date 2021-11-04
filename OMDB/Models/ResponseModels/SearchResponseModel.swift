//
//  SearchResponseModel.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

struct SearchResponse: Codable {
    let search: [SearchModel]
    let totalResults: String
    let response: String
    let error: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

struct SearchModel: Codable {
    let title: String
    let imdbID: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbID
        case poster = "Poster"
    }
}
