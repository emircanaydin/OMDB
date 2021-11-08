//
//  SplashViewBuilder.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import UIKit

class SplashViewBuilder {
    
    class func build(with completion: @escaping VoidBlock) -> UIViewController {
        let connectivityManager = ConnectivityManager.shared
        let remoteConfigManager = FirebaseRemoteConfigManager.shared
        let viewModel = SplashViewModel(connectivityManager: connectivityManager, remoteConfigManager: remoteConfigManager, completion: completion)
        return SplashViewController(viewModel: viewModel)
    }
}
