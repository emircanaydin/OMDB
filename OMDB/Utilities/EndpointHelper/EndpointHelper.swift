//
//  EndpointHelper.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
typealias ApiKey = EndpointHelper.ApiKey

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
    
    enum ApiKey: GenericValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .omdb:
                return "bb150e2d"
            }
        }
        
        case omdb
    }

}
