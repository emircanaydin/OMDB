//
//  MovieCardData.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

class MovieCardData: GenericDataProtocol {
    
    private(set) var posterData: CustomImageViewComponentData
    private(set) var title: String
    
    init(posterData: CustomImageViewComponentData, title: String) {
        self.posterData = posterData
        self.title = title
    }

}
