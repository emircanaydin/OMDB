//
//  SearchRequestModel.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

struct SearchRequestModel: Codable {
    var apiKey: String
    var searchTerm: String
    var page: Int
    
    private enum CodingKeys: String, CodingKey {
        case apiKey = "apikey"
        case searchTerm = "s"
        case page = "page"
    }
}
