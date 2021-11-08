//
//  SplashViewModel.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation

typealias VoidBlock = () -> Void

class SplashViewModel {
    
    private var splashFinalizeListener: VoidBlock?
    private let connectivityManager: ConnectivityManagerProtocol
    private let remoteConfigManager: FirebaseRemoteConfigManagerProtocol
    
    private var splashViewState: SplashViewStateBlock?
    
    init(connectivityManager: ConnectivityManagerProtocol, remoteConfigManager: FirebaseRemoteConfigManagerProtocol, completion: @escaping VoidBlock) {
        self.splashFinalizeListener = completion
        self.connectivityManager = connectivityManager
        self.remoteConfigManager = remoteConfigManager
        subscribeConnectivityManager()
    }
    
    // MARK: - Accesiable Methods
    func subscribeSplashViewState(with completion: @escaping SplashViewStateBlock) {
        splashViewState = completion
    }
    
    func fireApplicationInitiateProcess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.splashFinalizeListener?()
        }
    }
    
    // Not calling in init because expected to be called by the view controller according to the internet connection.
    func subscribeRemoteConfigManager() {
        remoteConfigManager.fetchRemoteConfig(with: remoteConfigListener)
    }
    
    // MARK: - Private Methods
    private func subscribeConnectivityManager() {
        connectivityManager.isConnectedToInternet(with: connectionListener)
    }
    
    private func connectionListenerHandler(with connection: Bool) {
        guard connection else {
            splashViewState?(.noInternet)
            return
        }
        splashViewState?(.loading)
    }
    
    private func remoteConfigListenerHandler(with splashText: String) {
        splashViewState?(.done(splashText))
    }
    
    // MARK: - Listener Handlers
    private lazy var connectionListener: BooleanBlock = { [weak self] connection in
        self?.connectionListenerHandler(with: connection)
    }
    
    private lazy var remoteConfigListener: StringBlock = { [weak self] splashText in
        self?.remoteConfigListenerHandler(with: splashText)
    }
}
