//
//  FoodTruckListLoader.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

public protocol FoodTruckListLoader {
    typealias Result = Swift.Result<[FoodTruck], Error>

    func getCurrentlyOpenedFoodTrucks(page: Int, pageSize: Int, completion: @escaping (Result) -> Void)
}
