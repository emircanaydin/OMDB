//
//  MovieCardDisplayerCollectionViewCell.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import UIKit

class MovieCardDisplayerCollectionViewCell: GenericCollectionViewCell<GenericDataProtocol, MovieCardView> {
    
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    func setViewConfigurations() {
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
    
}
