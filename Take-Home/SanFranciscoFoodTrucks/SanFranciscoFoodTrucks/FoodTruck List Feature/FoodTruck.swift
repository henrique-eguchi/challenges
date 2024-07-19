//
//  FoodTruck.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

public struct FoodTruck {
    let name: String
    let address: String
    let description: String
    let startTime: String
    let endTime: String

    var startAndEndTime: String {
        "\(startTime) - \(endTime)"
    }
}
