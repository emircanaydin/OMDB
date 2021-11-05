//
//  DetailRequestModel.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

struct DetailRequestModel: Codable {
    var apiKey: String
    var imdbID: String
    
    private enum CodingKeys: String, CodingKey {
        case apiKey = "apikey"
        case imdbID = "i"
    }
}
