//
//  CollectionComponentDelegate.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//

import Foundation

protocol CollectionComponentDelegate: AnyObject {
    
    func getItemCount(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func selectedItem(at index: Int)
    func isDataEmpty(in section: Int) -> Bool
}

extension CollectionComponentDelegate {
    func isDataEmpty(in section: Int) -> Bool { return true }
}
