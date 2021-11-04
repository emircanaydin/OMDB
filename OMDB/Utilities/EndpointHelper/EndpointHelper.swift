//
//  EndpointHelper.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls

enum EndpointHelper {
    
    enum BaseUrls: GenericValueProtocol {
        typealias Value = String
        
        var value: String {
            switch self {
            case .ombd:
                return "http://www.omdbapi.com/"
            }
        }
        
        case ombd
        
    }

}
