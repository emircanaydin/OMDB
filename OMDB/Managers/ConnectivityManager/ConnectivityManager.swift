//
//  ConnectivityManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation
import Reachability

class ConnectivityManager: ConnectivityManagerProtocol {
    
    public static let shared = ConnectivityManager()
    let reachability = try! Reachability()
    
    func isConnectedToInternet(with completion: @escaping BooleanBlock) {
        reachability.whenReachable = { reachability in
            completion(true)
        }
        
        reachability.whenUnreachable = { reachability in
            completion(false)
        }
        
        do {
            try reachability.startNotifier()
        } catch {}
    }
    
    func stopMonitor() {
        reachability.stopNotifier()
    }
}
