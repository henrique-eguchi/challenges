//
//  TopNodesListByConnectivityView.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import SwiftUI

struct TopNodesListByConnectivityView: View {
    @StateObject var viewModel: TopNodesByConnectivityViewModel

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .initial:
                    Text("Initial")
                case .loading:
                    ProgressView("Loading nodes...")
                case .success(let nodes):
                    List(nodes) { node in
                        NodeRow(node: node)
                    }
                case .failure(let error):
                    Text("Error fetching nodes: \(error.localizedDescription)")
                }
            }
            .navigationTitle("Top Nodes by Connectivity List")
            .refreshable {
                viewModel.fetchNodes()
            }
            .onAppear {
                viewModel.fetchNodes()
            }
        }
    }
}

struct NodeRow: View {
    let node: TopNode

    var body: some View {
        VStack(alignment: .leading) {
            Text(node.alias)
            Text("Capacity: \(node.capacityInBTCDescription) BTC")
        }
    }
}

#Preview {
    TopNodesListByConnectivityView(
        viewModel: TopNodesByConnectivityViewModel(
            topNodesService: RemoteTopNodesByConnectivityService(
                url: URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity")!,
                client: URLSessionHTTPClient()
            )
        )
    )
}
