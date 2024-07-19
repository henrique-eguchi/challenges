//
//  MainQueueDispatchDecorator.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import Foundation

extension MainQueueDispatchDecorator: FoodTruckListLoader where T == FoodTruckListLoader {
    public func getCurrentlyOpenedFoodTrucks(page: Int, pageSize: Int, completion: @escaping (FoodTruckListLoader.Result) -> Void) {
        decoratee.getCurrentlyOpenedFoodTrucks(page: page, pageSize: pageSize) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
