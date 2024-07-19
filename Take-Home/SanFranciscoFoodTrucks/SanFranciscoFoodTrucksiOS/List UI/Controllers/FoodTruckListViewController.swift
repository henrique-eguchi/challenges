//
//  FoodTruckListViewController.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import UIKit

final public class FoodTruckListViewController: UIViewController {
    var viewModel: FoodTruckListViewModel?
    var tableModel = [FoodTruckCellController]() {
        didSet { tableView.reloadData() }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: FoodTruckTableViewCell.self)
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)
        return refreshControl
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.refreshControl = refreshControl
        binding()
        refresh()
    }

    private func binding() {
        viewModel?.onLoadingStateChange = { [weak self] isLoading in
            isLoading ? self?.tableView.refreshControl?.beginRefreshing() : self?.tableView.refreshControl?.endRefreshing()
        }
    }

    private func refresh() {
        viewModel?.refreshFoodTrucks()
    }

    @objc private func refreshControlValueChanged() {
        refresh()
    }
}

extension FoodTruckListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellController(forRowAt: indexPath).view(in: tableView)
    }

    private func cellController(forRowAt indexPath: IndexPath) -> FoodTruckCellController {
        return tableModel[indexPath.row]
    }
}

extension FoodTruckListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastSectionIndex = tableView.numberOfSections - 1
       let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
       if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
           viewModel?.loadNextFoodTrucks()
       }
   }
}
