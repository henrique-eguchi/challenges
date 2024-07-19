//
//  FoodTruckCellController.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import UIKit

final class FoodTruckCellController {
    private let viewModel: FoodTruckCellViewModel

    init(viewModel: FoodTruckCellViewModel) {
        self.viewModel = viewModel
    }

    func view(in tableView: UITableView) -> UITableViewCell {
        let cell: FoodTruckTableViewCell = tableView.dequeueReusableCell()
        bind(cell)
        return cell
    }

    private func bind(_ cell: FoodTruckTableViewCell) {
        cell.titleLabel.text = viewModel.title
        cell.streetLabel.text = viewModel.street
        cell.descriptionLabel.text = viewModel.description
        cell.timeLabel.text = viewModel.openHours
    }
}
