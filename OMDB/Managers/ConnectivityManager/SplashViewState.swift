//
//  SplashViewState.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation

typealias SplashViewStateBlock = (SplashViewState) -> Void

enum SplashViewState {
    case noInternet
    case loading
    case done(String)
}
