//
//  GenericValueProtocol.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
