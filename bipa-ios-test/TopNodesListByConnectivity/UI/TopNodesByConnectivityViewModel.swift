//
//  TopNodesByConnectivityViewModel.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

final class TopNodesByConnectivityViewModel: ObservableObject {
    @Published var state: ViewState<[TopNode]> = .initial

    private let topNodesService: TopNodesByConnectivityServiceProtocol

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
                    self.state = .success(nodes)
                case .failure(let error):
                    self.state = .failure(error)
                }
            }
        }
    }
}
