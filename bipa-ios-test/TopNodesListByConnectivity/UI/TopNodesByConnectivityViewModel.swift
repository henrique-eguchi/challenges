//
//  TopNodesByConnectivityViewModel.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

final class TopNodesByConnectivityViewModel: ObservableObject {
    @Published var state: ViewState<[TopNode]> = .initial
    @Published var isFilteringByCapacity: Bool = false

    private let topNodesService: TopNodesByConnectivityServiceProtocol
    private var nodes: [TopNode] = []

    var sortedNodes: [TopNode] {
        if isFilteringByCapacity {
            return nodes.sorted { $0.capacity > $1.capacity }
        } else {
            return nodes.sorted { $0.channels > $1.channels }
        }
    }

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
}
