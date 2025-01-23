//
//  TopNodesByConnectivityViewModel.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

final class TopNodesByConnectivityViewModel: ObservableObject {
    @Published var state: ViewState<[TopNode]> = .initial
    @Published var isFiltering: Bool = false {
        didSet {
            toggleOrderByCapacity()
        }
    }

    private let topNodesService: TopNodesByConnectivityServiceProtocol
    private var nodes: [TopNode] = []

    init(topNodesService: TopNodesByConnectivityServiceProtocol) {
        self.topNodesService = topNodesService
    }

    func fetchNodes() {
        state = .loading

        topNodesService.fetchTopNodesByConnectivity { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let nodes):
                    self.nodes = nodes
                    self.state = .success(nodes)

                case .failure(let error):
                    self.state = .failure(error)
                }
            }
        }
    }

    private func setNodesOrdering() {
        if isFiltering {
            nodes = nodes.sorted { $0.capacity > $1.capacity }
        } else {
            nodes = nodes.sorted { $0.channels > $1.channels }
        }
    }

    func toggleOrderByCapacity() {
        setNodesOrdering()
        state = .success(nodes)
    }
}
