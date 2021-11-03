//
//  FirebaseRemoteConfigManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation
import Firebase

class FirebaseRemoteConfigManager: FirebaseRemoteConfigManagerProtocol {
    
    public static let shared = FirebaseRemoteConfigManager()
    private var remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {

    }

    func fetchRemoteConfig(with completion: @escaping StringBlock) {
        remoteConfig.fetchAndActivate { [weak self] (status, error) in
            guard error == nil else {
                completion("Error")
                return
            }
            
            completion(self?.remoteConfig["splash_text"].stringValue ?? "Unknown")
        }
    }
    
}
