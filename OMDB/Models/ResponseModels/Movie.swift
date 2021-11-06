//
//  Movie.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let released: String
    let genre: String
    let director: String
    let writer: String
    let actors, plot: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
    }
}
