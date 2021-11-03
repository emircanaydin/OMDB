//
//  MainFont.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import UIKit

enum MainFont: GenericValueProtocol {
    
    typealias Value = UIFont?
    
    case bold(CGFloat)
    case medium(CGFloat)
    case regular(CGFloat)
    
    var value: UIFont? {
        switch self {
        case .bold(let size):
            return UIFont(name:"Roboto-Bold", size: size)
        case .medium(let size):
            return UIFont(name:"Roboto-Medium", size: size)
        case .regular(let size):
            return UIFont(name:"Roboto-Regular", size: size)
        }
    }
    
}
