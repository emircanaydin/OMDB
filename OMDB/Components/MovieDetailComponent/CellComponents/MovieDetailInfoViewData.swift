//
//  MovieDetailInfoViewData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

class MovieDetailInfoViewData {
    
    private(set) var genre: String
    private(set) var plot: String
    
    init(genre: String, plot: String) {
        self.genre = genre
        self.plot = plot
    }
}
