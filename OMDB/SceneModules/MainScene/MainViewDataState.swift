//
//  MainViewDataState.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

typealias MainViewDataStateBlock = (MainViewDataState) -> Void

enum MainViewDataState {
    case loading
    case newData
    case moreData
    case failure
}
