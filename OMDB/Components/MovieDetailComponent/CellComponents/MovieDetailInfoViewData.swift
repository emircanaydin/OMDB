//
//  MovieDetailInfoViewData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

class MovieDetailInfoViewData {
    
    private(set) var movieName: String
    private(set) var movieYear: String
    private(set) var genre: String
    private(set) var plot: String
    
    init(movieName: String, movieYear: String, genre: String, plot: String) {
        self.movieName = movieName
        self.movieYear = movieYear
        self.genre = genre
        self.plot = plot
    }
}
