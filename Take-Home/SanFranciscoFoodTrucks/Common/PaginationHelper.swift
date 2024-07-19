//
//  PaginationHelper.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

final class PaginationHelper {
    static func getOffsetBy(_ page: Int, _ pageSize: Int) -> Int {
        page * pageSize
    }
}
