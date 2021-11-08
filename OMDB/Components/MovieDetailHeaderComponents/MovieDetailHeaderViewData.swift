//
//  MovieDetailHeaderViewData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

class MovieDetailHeaderViewData {
    
    private(set) var imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")
    
    init(imageContainerData: CustomImageViewComponentData = CustomImageViewComponentData(imageUrl: "")) {
        self.imageContainerData = imageContainerData
    }
    
}
