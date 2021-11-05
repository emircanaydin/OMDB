//
//  PaginationInfo.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var isError: Bool = false
    var page: Int = 1
    var fetching: Bool = false
    var limit: Int = 10
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !isError && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        page += 1
    }
}
