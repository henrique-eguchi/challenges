//
//  FoodTruckListViewModel.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import Foundation

final public class FoodTruckListViewModel {
    private let foodTruckListLoader: FoodTruckListLoader
    private let pageSize = 10
    private var page = 0
    private var isLoading = false
    private var isFullyLoaded = false
    private var foodTrucks: [FoodTruck] = []

    init(foodTruckListLoader: FoodTruckListLoader) {
        self.foodTruckListLoader = foodTruckListLoader
    }

    var onLoadingStateChange: ((Bool) -> Void)?
    var onFoodTrucksLoad: (([FoodTruck]) -> Void)?

    private func loadFoodTrucks(isRefreshing: Bool = false) {
        isLoading = true
        onLoadingStateChange?(true)

        foodTruckListLoader.getCurrentlyOpenedFoodTrucks(
            page: page,
            pageSize: pageSize
        ) { [weak self] result in
            guard let self else { return }
            if let foodTruckList = try? result.get() {
                if isRefreshing {
                    foodTrucks = foodTruckList
                } else {
                    foodTrucks.append(contentsOf: foodTruckList)
                }
                self.isFullyLoaded = foodTruckList.count < self.pageSize
                self.onFoodTrucksLoad?(foodTrucks)
            }

            self.isLoading = false
            self.onLoadingStateChange?(false)
        }
    }

    func loadNextFoodTrucks() {
        guard !isLoading && !isFullyLoaded else {
            onLoadingStateChange?(false)
            return
        }
        page += 1
        loadFoodTrucks()
    }

    func refreshFoodTrucks() {
        page = 0
        isFullyLoaded = false
        loadFoodTrucks(isRefreshing: true)
    }
}
