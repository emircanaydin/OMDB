//
//  MovieDetailFooterViewData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

class MovieDetailFooterViewData {
    
    private(set) var director: String
    private(set) var writers: String
    private(set) var actors: String
    private(set) var releasedDate: String
    
    init(director: String, writers: String, actors: String, releasedDate: String) {
        self.director = director
        self.writers = writers
        self.actors = actors
        self.releasedDate = releasedDate
    }

}
