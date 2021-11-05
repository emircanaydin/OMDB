//
//  MovieDetailViewData.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

class MovieDetailViewData {
    
    private(set) var headerViewData: MovieDetailHeaderViewData?
    private(set) var infoViewData: [MovieDetailInfoViewData] = [MovieDetailInfoViewData]()
    private(set) var footerViewData: MovieDetailFooterViewData?
    
    func setHeaderViewData(by value: MovieDetailHeaderViewData) -> Self {
        headerViewData = value
        return self
    }
    
    func setInfoViewData(by value: [MovieDetailInfoViewData]) -> Self {
        infoViewData = value
        return self
    }
    
    func setFooterViewData(by value: MovieDetailFooterViewData) -> Self {
        footerViewData = value
        return self
    }
}
