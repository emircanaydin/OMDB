//
//  BackgroundImages.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import UIKit

enum PageViewImages: String, GenericValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case defaultSplashBackground = "defaultSplashBackground"
}
