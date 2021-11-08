//
//  MovieDetailInfoCellView.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import UIKit

class MovieDetailInfoCellView: GenericCollectionViewCell<MovieDetailInfoViewData, MovieDetailInfoView> {
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        var targetSize = targetSize
        targetSize.height = CGFloat.greatestFiniteMagnitude
        
        let size = super.systemLayoutSizeFitting(targetSize,
                                                 withHorizontalFittingPriority: .required,
                                                 verticalFittingPriority: .fittingSizeLevel
        )
        return size
    }
}
