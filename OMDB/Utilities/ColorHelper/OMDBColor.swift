//
//  OMDBColor.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import UIKit

enum OMDBColor: GenericValueProtocol {

    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
        case .defaultBackground:
            return #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        }
    }
    
    case defaultBackground
    
}
