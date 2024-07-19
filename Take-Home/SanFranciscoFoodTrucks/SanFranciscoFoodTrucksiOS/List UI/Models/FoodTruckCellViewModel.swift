//
//  FoodTruckCellViewModel.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import Foundation

final class FoodTruckCellViewModel {
    private let model: FoodTruck

    init(model: FoodTruck) {
        self.model = model
    }

    var title: String {
        model.name
    }

    var street: String {
        model.address
    }

    var description: String {
        model.description
    }

    var openHours: String {
        model.startAndEndTime
    }
}
