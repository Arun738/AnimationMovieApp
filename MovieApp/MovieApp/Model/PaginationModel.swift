//
//  PaginationModel.swift
//  MovieApp
//
//  Created by Arun Tiwari on 14/05/25.
//

import Foundation

struct PaginationModel {
    var currentPage = 0
    let limit = 8
    var isLastPage = false
}

extension PaginationModel {
    var offset: Int {
        return currentPage * limit
    }
}
