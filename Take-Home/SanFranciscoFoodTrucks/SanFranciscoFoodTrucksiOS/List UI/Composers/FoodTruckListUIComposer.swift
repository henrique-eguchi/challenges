//
//  FoodTruckListUIComposer.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import Foundation

public final class FoodTruckListUIComposer {
    private init() {}

    public static func foodTruckListComposedWith(foodTruckListLoader: FoodTruckListLoader) -> FoodTruckListViewController {
        let foodTruckListViewModel = FoodTruckListViewModel(
            foodTruckListLoader: MainQueueDispatchDecorator(decoratee: foodTruckListLoader)
        )

        let foodTruckListViewController = makeFoodTruckListViewController(title: "Food Trucks")
        foodTruckListViewController.viewModel = foodTruckListViewModel

        foodTruckListViewModel.onFoodTrucksLoad = adaptFoodTrucksToCellControllers(
            forwardingTo: foodTruckListViewController
        )

        return foodTruckListViewController
    }

    private static func makeFoodTruckListViewController(title: String) -> FoodTruckListViewController {
        let foodTruckListViewController = FoodTruckListViewController()
        foodTruckListViewController.title = title
        return foodTruckListViewController
    }

    private static func adaptFoodTrucksToCellControllers(forwardingTo controller: FoodTruckListViewController) -> ([FoodTruck]) -> Void {
        return { [weak controller] foodTrucks in
            controller?.tableModel = foodTrucks.map { model in
                let viewModel = FoodTruckCellViewModel(model: model)
                return FoodTruckCellController(viewModel: viewModel)
            }
        }
    }
}
