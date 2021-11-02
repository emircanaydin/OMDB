//
//  ConnectivityManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation
import Network

class ConnectivityManager: ConnectivityManagerProtocol {
    
    public static let shared = ConnectivityManager()
    let monitor = NWPathMonitor()
    
    private init() {
        monitor.start(queue: DispatchQueue(label: "PathMonitor"))
    }
    
    func isConnectedToInternet(with completion: @escaping BooleanBlock) {
        monitor.pathUpdateHandler = { path in
            completion((path.status == .satisfied) ? true : false)
        }
    }
    
    func stopMonitor() {
        monitor.cancel()
    }
}
