//
//  ConnectivityManagerProtocol.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation

typealias BooleanBlock = (Bool) -> Void

protocol ConnectivityManagerProtocol {
    
    func isConnectedToInternet(with completion: @escaping BooleanBlock)
    func stopMonitor()
}
