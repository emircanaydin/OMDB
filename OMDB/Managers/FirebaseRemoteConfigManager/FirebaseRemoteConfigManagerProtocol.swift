//
//  FirebaseRemoteConfigManagerProtocol.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation

typealias StringBlock = (String) -> Void

protocol FirebaseRemoteConfigManagerProtocol {
    
    func fetchRemoteConfig(with completion: @escaping StringBlock)
}
